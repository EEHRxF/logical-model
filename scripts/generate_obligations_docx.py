#!/usr/bin/env python3
"""Generate obligation tables directly from the project's FSH sources."""

# Usage:
#   python3 scripts/generate_obligations_docx.py
#   python3 scripts/generate_obligations_docx.py fsh-generated/resources
#   python3 scripts/generate_obligations_docx.py input/fsh/EHDS-models/medicationPrescription.fsh
#   python3 scripts/generate_obligations_docx.py --input-path input/fsh/EHDS-models -o out/obligations.docx
#
# Input parameters:
#   input
#     Optional positional path to a SUSHI-generated StructureDefinition `.json`,
#     a logical-model `.fsh`, or a directory containing either format. Defaults
#     to `fsh-generated/resources`.
#   -i, --input-path
#     Optional named path to a single logical-model `.fsh` file or a directory
#     containing them. If provided, it overrides the positional
#     `input` argument.
#   --actors
#     FSH file containing ActorDefinition instances.
#   --rulesets
#     FSH file mapping obligation RuleSets to actors.
#   --source-format
#     Input format: auto, json, or fsh. Defaults to auto.
#   --expand-variants
#     Keep each polymorphic `[x]` element and generate its allowed types as
#     child rows. Slices are retained and expanded independently. This is the
#     default; use `--no-expand-variants` for compact output.
#   --model-slice-name-only
#     Name EHDS model slices only by their target model, without the base
#     element name prefix. Disabled by default.
#   -o, --output
#     Optional output path for the generated `.docx` file.

from __future__ import annotations

import argparse
import json
import re
from copy import deepcopy
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable

from docx import Document
from docx.enum.section import WD_ORIENT
from docx.enum.text import WD_PARAGRAPH_ALIGNMENT
from docx.enum.table import WD_ALIGN_VERTICAL, WD_TABLE_ALIGNMENT
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.shared import Inches, Mm, Pt


HEADER_FILL = "D9D9D9"
# Column proportions copied from doc/Table 1.docx (twips).
TABLE_BASE_WIDTHS = [674, 1545, 5351, 1985, 850, 1559]
TABLE_ACTOR_WIDTHS = [1418, 1303]

RULE_RE = re.compile(r"^(\s*)\*\s+(.+?)\s*$")
INSERT_RE = re.compile(r"^insert\s+([A-Za-z][A-Za-z0-9_-]*)\((.*)\)\s*$")
CARDINALITY_RE = re.compile(r"^(\d+|\*)\.\.(\d+|\*)$")
OBLIGATION_URL = "http://hl7.org/fhir/StructureDefinition/obligation"


@dataclass
class ObligationEntry:
    code: str = ""
    documentation: str = ""


@dataclass
class ObligationRow:
    level: int
    name: str
    description: str = ""
    data_type: str = ""
    cardinality: str = ""
    binding: str = ""
    obligations: dict[str, list[ObligationEntry]] = field(default_factory=dict)


@dataclass
class LogicalModel:
    logical_name: str
    parent: str = ""
    title: str = ""
    description: str = ""
    elements: list[ObligationRow] = field(default_factory=list)


@dataclass
class ModelMetadata:
    title: str = ""
    description: str = ""


@dataclass
class Actor:
    id: str
    url: str
    name: str
    title: str = ""
    description: str = ""

    @property
    def display(self) -> str:
        return self.title or self.name or self.id


@dataclass
class RuleSetDefinition:
    name: str
    actor_reference: str = ""
    code_template: str = "{strength}:process"
    documentation_template: str = ""


@dataclass
class ParsedElement:
    path: str
    description: str = ""
    data_type: str = ""
    cardinality: str = ""
    binding: str = ""
    obligations: dict[str, list[ObligationEntry]] = field(default_factory=dict)


@dataclass
class StructureDefinitionRepository:
    by_url: dict[str, dict]
    by_id: dict[str, dict]
    by_name: dict[str, dict]

    def get(self, reference: str) -> dict | None:
        if not reference:
            return None
        return self.by_url.get(reference) or self.by_id.get(reference) or self.by_name.get(reference)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a Word document from ActorDefinition, RuleSet, and logical-model FSH sources."
    )
    parser.add_argument(
        "input",
        nargs="?",
        help=(
            "SUSHI StructureDefinition JSON, logical-model FSH, or directory. "
            "Defaults to fsh-generated/resources for auto/json and input/fsh/EHDS-models for fsh."
        ),
    )
    parser.add_argument(
        "-i",
        "--input-path",
        dest="input_path",
        help="StructureDefinition JSON, logical-model FSH, or directory. Overrides the positional input argument.",
    )
    parser.add_argument(
        "--actors",
        default="input/fsh/Obligations/supportLevels.fsh",
        help="FSH file containing ActorDefinition instances.",
    )
    parser.add_argument(
        "--rulesets",
        default="input/fsh/Obligations/ruleset.fsh",
        help="FSH file defining the obligation RuleSets.",
    )
    parser.add_argument(
        "--source-format",
        choices=("auto", "json", "fsh"),
        default="auto",
        help="Input format. 'auto' infers it from the input; defaults to auto.",
    )
    parser.add_argument(
        "--expand-variants",
        "--expand-polymorphic-and-slices",
        action=argparse.BooleanOptionalAction,
        default=True,
        help=(
            "Keep each polymorphic [x] element and generate its allowed types as child rows. "
            "Each slice remains separate and is expanded independently. Enabled by default."
        ),
    )
    parser.add_argument(
        "--model-slice-name-only",
        action="store_true",
        help=(
            "Name an expanded EHDS model slice only by its target model "
            "(EHDSHealthProfessional instead of authorEHDSHealthProfessional)."
        ),
    )
    parser.add_argument(
        "-o",
        "--output",
        default="out/obligations.docx",
        help="Output .docx path. Defaults to out/obligations.docx.",
    )
    return parser.parse_args()


def iter_input_files(input_path: Path, source_format: str = "auto") -> Iterable[Path]:
    if not input_path.exists():
        raise SystemExit(f"Input path does not exist: {input_path}")
    if input_path.is_file():
        if input_path.suffix.lower() not in {".fsh", ".json"}:
            raise SystemExit(f"Input file must have a .fsh or .json extension: {input_path}")
        actual_format = input_path.suffix.lower().lstrip(".")
        if source_format != "auto" and source_format != actual_format:
            raise SystemExit(
                f"Input file {input_path} is {actual_format}, but --source-format is {source_format}"
            )
        yield input_path
        return
    if not input_path.is_dir():
        raise SystemExit(f"Input path must be a directory, .fsh file, or .json file: {input_path}")
    json_files = sorted(input_path.glob("StructureDefinition-*.json"))
    fsh_files = sorted(input_path.glob("*.fsh"))
    if source_format == "json":
        candidates = json_files
    elif source_format == "fsh":
        candidates = fsh_files
    else:
        candidates = json_files or fsh_files
    if not candidates:
        expected = "StructureDefinition JSON" if source_format == "json" else "FSH" if source_format == "fsh" else "JSON or FSH"
        raise SystemExit(f"No {expected} input files found in {input_path}")
    for path in candidates:
        if path.is_file():
            yield path


def sanitize_text(value: str) -> str:
    return value.replace("\\", "").strip()


def sentence_text(value: str) -> str:
    value = sanitize_text(value)
    if value and value[-1] not in ".!?":
        return value + "."
    return value


def strip_comment(value: str) -> str:
    """Strip FSH // comments while preserving text inside quoted strings."""
    in_string = False
    escaped = False
    for index, character in enumerate(value):
        if character == '"' and not escaped:
            in_string = not in_string
        if character == "/" and not in_string and value[index : index + 2] == "//":
            return value[:index].rstrip()
        escaped = character == "\\" and not escaped
        if character != "\\":
            escaped = False
    return value.strip()


def unquote(value: str) -> str:
    value = value.strip()
    if value.startswith('"""') and value.endswith('"""'):
        return sanitize_text(value[3:-3])
    if value.startswith('"') and value.endswith('"'):
        return sanitize_text(value[1:-1])
    return sanitize_text(value)


def parse_fsh_model_metadata(path: Path) -> tuple[str, ModelMetadata] | None:
    logical_name = ""
    title = ""
    description = ""
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        stripped = raw_line.strip()
        if stripped.startswith("Logical:"):
            logical_name = stripped.split(":", 1)[1].strip()
            continue
        if stripped.startswith("Title:"):
            title = unquote(stripped.split(":", 1)[1])
            continue
        if stripped.startswith("Description:"):
            description = unquote(stripped.split(":", 1)[1])
            continue
    if not logical_name:
        return None
    return logical_name, ModelMetadata(title=title, description=description)


def load_fsh_model_metadata(input_path: Path) -> dict[str, ModelMetadata]:
    if not input_path.exists():
        return {}
    if input_path.is_file():
        files = [input_path] if input_path.suffix.lower() == ".fsh" else []
    else:
        files = sorted(input_path.glob("*.fsh"))
    result: dict[str, ModelMetadata] = {}
    for file_path in files:
        parsed = parse_fsh_model_metadata(file_path)
        if parsed is not None:
            logical_name, metadata = parsed
            result[logical_name] = metadata
    return result


def read_aliases(paths: Iterable[Path]) -> dict[str, str]:
    aliases: dict[str, str] = {}
    for path in paths:
        if not path.exists():
            continue
        for line in path.read_text(encoding="utf-8").splitlines():
            match = re.match(r"^Alias:\s*(\$[A-Za-z0-9_-]+)\s*=\s*(\S+)\s*$", line.strip())
            if match:
                aliases[match.group(1)] = match.group(2)
    return aliases


def resolve_alias(value: str, aliases: dict[str, str]) -> str:
    return aliases.get(value.strip(), value.strip())


def parse_actors(path: Path, aliases: dict[str, str]) -> list[Actor]:
    if not path.exists():
        raise SystemExit(f"Actor FSH file does not exist: {path}")

    actors: list[Actor] = []
    current: dict[str, str] | None = None
    lines = path.read_text(encoding="utf-8").splitlines()

    def finish() -> None:
        nonlocal current
        if current and current.get("instance_of") == "ActorDefinition":
            actor_id = current.get("id", "")
            actors.append(
                Actor(
                    id=actor_id,
                    url=resolve_alias(current.get("url", ""), aliases),
                    name=current.get("name", actor_id),
                    title=current.get("title", ""),
                    description=current.get("description", ""),
                )
            )
        current = None

    index = 0
    while index < len(lines):
        line = lines[index].strip()
        if line.startswith("Instance:"):
            finish()
            current = {"id": line.split(":", 1)[1].strip()}
        elif current is not None and line.startswith("InstanceOf:"):
            current["instance_of"] = line.split(":", 1)[1].strip()
        elif current is not None and line.startswith("Title:"):
            current["title"] = unquote(line.split(":", 1)[1])
        elif current is not None and line.startswith("Description:"):
            value = line.split(":", 1)[1].strip()
            if value.startswith('"""') and not value.endswith('"""'):
                parts = [value[3:]]
                index += 1
                while index < len(lines) and '"""' not in lines[index]:
                    parts.append(lines[index])
                    index += 1
                parts.append(lines[index].split('"""', 1)[0])
                current["description"] = sanitize_text("\n".join(parts))
            else:
                current["description"] = unquote(value)
        elif current is not None:
            rule = RULE_RE.match(line)
            if rule:
                content = strip_comment(rule.group(2))
                assignment = re.match(r"^(url|name)\s*=\s*(.+)$", content)
                if assignment:
                    current[assignment.group(1)] = unquote(assignment.group(2))
        index += 1
    finish()

    if not actors:
        raise SystemExit(f"No ActorDefinition instances found in {path}")
    return actors


def parse_rulesets(path: Path) -> dict[str, RuleSetDefinition]:
    if not path.exists():
        raise SystemExit(f"RuleSet FSH file does not exist: {path}")

    definitions: dict[str, RuleSetDefinition] = {}
    current: RuleSetDefinition | None = None
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        declaration = re.match(r"^RuleSet:\s*([A-Za-z][A-Za-z0-9_-]*)", line)
        if declaration:
            current = RuleSetDefinition(name=declaration.group(1))
            definitions[current.name] = current
            continue
        if current is None:
            continue
        rule = RULE_RE.match(raw_line)
        if not rule:
            continue
        content = strip_comment(rule.group(2))
        if ".extension[actor].valueCanonical" in content and "=" in content:
            current.actor_reference = content.rsplit("=", 1)[1].strip()
        elif ".extension[code].valueCode" in content and "=" in content:
            current.code_template = content.rsplit("=", 1)[1].strip().lstrip("#")
        elif ".extension[documentation].valueMarkdown" in content and "=" in content:
            current.documentation_template = unquote(content.rsplit("=", 1)[1])
    return definitions


def format_template(template: str, arguments: list[str], parameter_names: list[str] | None = None) -> str:
    result = template
    values = [argument.strip().lstrip("#") for argument in arguments]
    names = parameter_names or ["strength"]
    for index, value in enumerate(values):
        if index < len(names):
            result = result.replace("{" + names[index] + "}", value)
    return sanitize_text(result.lstrip("#"))


def quoted_tail(value: str) -> str:
    match = re.search(r'"((?:\\.|[^"\\])*)"\s*$', value)
    return sanitize_text(match.group(1)) if match else ""


def apply_fsh_metadata(element: ParsedElement, expression: str) -> None:
    assignment = re.match(r"^\^(short|definition|binding\.description|binding\.strength)\s*=\s*(.+)$", expression)
    if not assignment:
        return
    field_name, value = assignment.groups()
    value = unquote(value)
    if field_name in {"short", "definition"}:
        element.description = value
    elif field_name == "binding.description":
        element.binding = value


def build_structure_definition_repository(paths: Iterable[Path]) -> StructureDefinitionRepository:
    by_url: dict[str, dict] = {}
    by_id: dict[str, dict] = {}
    by_name: dict[str, dict] = {}
    for path in paths:
        if path.suffix.lower() != ".json":
            continue
        definition = json.loads(path.read_text(encoding="utf-8"))
        if definition.get("resourceType") != "StructureDefinition":
            continue
        if definition.get("url"):
            by_url[definition["url"]] = definition
        if definition.get("id"):
            by_id[definition["id"]] = definition
        if definition.get("name"):
            by_name[definition["name"]] = definition
    return StructureDefinitionRepository(by_url=by_url, by_id=by_id, by_name=by_name)


def structure_element_key(element: dict) -> str | None:
    value = element.get("id") or element.get("path")
    if not value:
        return None
    return value.split(".", 1)[1] if "." in value else ""


def is_element_at_or_below(path: str, ancestor: str) -> bool:
    """Return whether path identifies ancestor itself, its slice, or a descendant."""
    if not ancestor:
        return True
    if path == ancestor or path.startswith(ancestor + "."):
        return True
    last_segment = ancestor.rsplit(".", 1)[-1]
    return ":" not in last_segment and path.startswith(ancestor + ":")


def filter_zero_cardinality_structure_elements(elements: list[dict]) -> list[dict]:
    excluded = [
        key
        for element in elements
        if element.get("max") == "0" and (key := structure_element_key(element)) is not None
    ]
    return [
        element
        for element in elements
        if (key := structure_element_key(element)) is not None
        and not any(is_element_at_or_below(key, ancestor) for ancestor in excluded)
    ]


def filter_zero_cardinality_fsh_elements(elements: dict[str, ParsedElement]) -> dict[str, ParsedElement]:
    excluded = [path for path, element in elements.items() if element.cardinality == "0..0"]
    return {
        path: element
        for path, element in elements.items()
        if not any(is_element_at_or_below(path, ancestor) for ancestor in excluded)
    }


def structure_parent_key(key: str) -> str:
    if not key:
        return ""
    if "." in key:
        prefix, last_segment = key.rsplit(".", 1)
        if ":" in last_segment:
            return f"{prefix}.{last_segment.split(':', 1)[0]}"
        return prefix
    if ":" in key:
        return key.split(":", 1)[0]
    return ""


def hierarchical_element_keys(keys: Iterable[str]) -> list[str]:
    """Order elements in document-tree preorder while preserving sibling order."""
    ordered_input = list(dict.fromkeys(keys))
    available = set(ordered_input)
    children: dict[str, list[str]] = {}
    for key in ordered_input:
        if not key:
            continue
        parent = structure_parent_key(key)
        while parent and parent not in available:
            parent = structure_parent_key(parent)
        children.setdefault(parent, []).append(key)

    result: list[str] = []
    visited: set[str] = set()

    def visit(key: str) -> None:
        if key in visited:
            return
        visited.add(key)
        if key in available:
            result.append(key)
        for child in children.get(key, []):
            visit(child)

    if "" in available:
        visit("")
    else:
        for key in children.get("", []):
            visit(key)
    for key in ordered_input:
        visit(key)
    return result


def sort_structure_elements_hierarchically(elements: list[dict]) -> list[dict]:
    by_key = {
        key: element
        for element in elements
        if (key := structure_element_key(element)) is not None
    }
    return [by_key[key] for key in hierarchical_element_keys(by_key)]


def choice_type_suffix(data_type: str) -> str:
    data_type = display_type_code(data_type.strip())
    return data_type[:1].upper() + data_type[1:]


def expanded_variant_name(element_name: str, data_type: str, model_slice_name_only: bool = False) -> str:
    data_type = display_type_code(data_type.strip())
    if model_slice_name_only and data_type.startswith("EHDS"):
        return data_type
    return element_name.replace("[x]", choice_type_suffix(data_type))


def expand_polymorphic_rows(
    models: list[LogicalModel], model_slice_name_only: bool = False
) -> list[LogicalModel]:
    """Keep each [x] row and add its concrete types as child rows."""
    expanded_models = deepcopy(models)
    for model in expanded_models:
        rows: list[ObligationRow] = []
        for element in model.elements:
            data_types = list(
                dict.fromkeys(part.strip() for part in element.data_type.split(" or ") if part.strip())
            )
            if "[x]" not in element.name or not data_types:
                rows.append(element)
                continue
            is_abstract_container = len(data_types) == 1 and data_types[0] == "Base"
            if is_abstract_container:
                rows.append(element)
                continue
            element.data_type = ""
            rows.append(element)
            for data_type in data_types:
                variant = ObligationRow(
                    level=element.level + 1,
                    name=expanded_variant_name(element.name, data_type, model_slice_name_only),
                    data_type=data_type,
                )
                rows.append(variant)
        model.elements = rows
    return expanded_models


def display_type_code(code: str) -> str:
    if "/StructureDefinition/" in code:
        return code.rsplit("/", 1)[-1]
    return code


def format_parent_data_type(parent: str) -> str:
    parent_name = display_type_code(parent.strip())
    if not parent_name or parent_name == "Base":
        return "Base"
    return f"Derived from parent data type: {parent_name}"


def format_element_types(element: dict) -> str:
    types = [display_type_code(item.get("code", "")) for item in element.get("type", []) or []]
    types = [item for item in types if item]
    if types:
        return " or ".join(types)
    return ""


def merge_structure_elements(base_elements: list[dict], differential_elements: list[dict]) -> list[dict]:
    merged = [deepcopy(element) for element in base_elements]
    index_by_key = {
        key: index
        for index, element in enumerate(merged)
        if (key := structure_element_key(element)) is not None
    }
    for differential in differential_elements:
        key = structure_element_key(differential)
        if key is not None and key in index_by_key:
            merged[index_by_key[key]].update(deepcopy(differential))
        else:
            merged.append(deepcopy(differential))
            if key is not None:
                index_by_key[key] = len(merged) - 1
    return merged


def resolve_structure_elements(
    definition: dict,
    repository: StructureDefinitionRepository,
    seen: set[str] | None = None,
) -> list[dict]:
    seen = set(seen or set())
    identity = definition.get("url") or definition.get("id") or definition.get("name", "")
    if identity in seen:
        raise SystemExit(f"Cyclic baseDefinition chain detected at {identity}")
    if identity:
        seen.add(identity)

    base_elements: list[dict] = []
    base = repository.get(definition.get("baseDefinition", ""))
    if base is not None:
        base_elements = resolve_structure_elements(base, repository, seen)
    differential = definition.get("differential", {}).get("element", []) or []
    return merge_structure_elements(base_elements, differential)


def element_obligations(
    element: dict,
    actors_by_url: dict[str, Actor],
    definition_name: str,
) -> dict[str, list[ObligationEntry]]:
    result: dict[str, list[ObligationEntry]] = {}
    obligation_extensions = [
        extension
        for extension in element.get("extension", []) or []
        if extension.get("url") == OBLIGATION_URL
    ]

    def obligation_key(entry: ObligationEntry) -> str:
        return entry.code.split(":", 1)[1] if ":" in entry.code else entry.code

    def replace_same_key(entries: list[ObligationEntry], entry: ObligationEntry) -> None:
        key = obligation_key(entry)
        for index, existing in enumerate(entries):
            if obligation_key(existing) == key:
                entries[index] = entry
                return
        entries.append(entry)

    for extension in obligation_extensions:
        extension_result: dict[str, list[ObligationEntry]] = {}
        children = extension.get("extension", []) or []
        codes = [
            sanitize_text(child.get("valueCode", ""))
            for child in children
            if child.get("url") == "code"
        ]
        actor_urls = [
            child.get("valueCanonical", "")
            for child in children
            if child.get("url") == "actor"
        ]
        documentation = next(
            (
                sanitize_text(child.get("valueMarkdown", ""))
                for child in children
                if child.get("url") == "documentation"
            ),
            "",
        )
        for index, actor_url in enumerate(actor_urls):
            if actor_url not in actors_by_url:
                raise SystemExit(f"Obligation on {definition_name} refers to unknown actor {actor_url}")
            code = codes[0] if len(codes) == 1 else codes[index] if index < len(codes) else ""
            entry = ObligationEntry(code=code, documentation=documentation)
            replace_same_key(extension_result.setdefault(actor_url, []), entry)
        for actor_url, entries in extension_result.items():
            target_entries = result.setdefault(actor_url, [])
            existing_keys = {obligation_key(entry) for entry in target_entries}
            for entry in entries:
                if obligation_key(entry) not in existing_keys:
                    target_entries.append(entry)
                    existing_keys.add(obligation_key(entry))
    return result


def resolve_structure_obligations(
    definition: dict,
    repository: StructureDefinitionRepository,
    actors_by_url: dict[str, Actor],
    seen: set[str] | None = None,
) -> dict[str, dict[str, list[ObligationEntry]]]:
    """Resolve inherited obligations, overriding only actors changed by the child."""
    seen = set(seen or set())
    identity = definition.get("url") or definition.get("id") or definition.get("name", "")
    if identity in seen:
        raise SystemExit(f"Cyclic baseDefinition chain detected at {identity}")
    if identity:
        seen.add(identity)

    result: dict[str, dict[str, list[ObligationEntry]]] = {}
    base = repository.get(definition.get("baseDefinition", ""))
    if base is not None:
        inherited = resolve_structure_obligations(base, repository, actors_by_url, seen)
        result = deepcopy(inherited)

    definition_name = definition.get("id") or definition.get("name") or identity
    for element in definition.get("differential", {}).get("element", []) or []:
        key = structure_element_key(element)
        if key is None:
            continue
        own_obligations = element_obligations(element, actors_by_url, definition_name)
        if not own_obligations:
            continue
        target = result.setdefault(key, {})
        for actor_url, entries in own_obligations.items():
            target[actor_url] = deepcopy(entries)
    return result


def parse_structure_obligations(
    path: Path,
    repository: StructureDefinitionRepository,
    actors: list[Actor],
    fsh_metadata_by_name: dict[str, ModelMetadata] | None = None,
) -> LogicalModel | None:
    definition = json.loads(path.read_text(encoding="utf-8"))
    if definition.get("resourceType") != "StructureDefinition" or definition.get("kind") != "logical":
        return None

    logical_name = definition.get("id") or definition.get("name") or path.stem
    fsh_metadata = (fsh_metadata_by_name or {}).get(logical_name, ModelMetadata())
    model_title = fsh_metadata.title or sanitize_text(definition.get("title", ""))
    model_description = fsh_metadata.description or sanitize_text(definition.get("description", ""))
    actors_by_url = {actor.url: actor for actor in actors}
    resolved_elements = resolve_structure_elements(definition, repository)
    obligations_by_key = resolve_structure_obligations(definition, repository, actors_by_url)

    visible_elements = sort_structure_elements_hierarchically(
        filter_zero_cardinality_structure_elements(resolved_elements)
    )
    rows: list[ObligationRow] = []
    for element in visible_elements:
        key = structure_element_key(element)
        if key is None:
            continue
        minimum = element.get("min")
        maximum = element.get("max")
        cardinality = "" if minimum is None and maximum is None else f"{minimum or 0}..{maximum or ''}"
        binding = element.get("binding", {}) or {}
        rows.append(
            ObligationRow(
                level=0 if not key else key.count(".") + 1,
                name=logical_name if not key else sanitize_text(key.rsplit(".", 1)[-1]),
                description=sentence_text(model_title or element.get("short") or element.get("definition") or "")
                if not key
                else sanitize_text(element.get("short") or element.get("definition") or ""),
                data_type=format_parent_data_type(definition.get("baseDefinition", ""))
                if not key
                else format_element_types(element),
                cardinality=cardinality,
                binding=sanitize_text(binding.get("description") or binding.get("valueSet") or ""),
                obligations={
                    actor.url: list(obligations_by_key.get(key, {}).get(actor.url, [])) for actor in actors
                },
            )
        )

    if not rows:
        return None
    return LogicalModel(
        logical_name=logical_name,
        parent=definition.get("baseDefinition", ""),
        title=model_title,
        description=model_description,
        elements=rows,
    )


def parse_logical_model(
    path: Path,
    rulesets: dict[str, RuleSetDefinition],
    actors_by_reference: dict[str, Actor],
    aliases: dict[str, str],
) -> tuple[LogicalModel, dict[str, ParsedElement]] | None:
    logical_name = ""
    parent_name = ""
    model_title = ""
    model_description = ""
    elements: dict[str, ParsedElement] = {}
    stack: list[tuple[int, str]] = []

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        stripped = raw_line.strip()
        if stripped.startswith("Logical:"):
            logical_name = stripped.split(":", 1)[1].strip()
            continue
        if stripped.startswith("Parent:"):
            parent_name = stripped.split(":", 1)[1].strip()
            continue
        if stripped.startswith("Title:"):
            model_title = unquote(stripped.split(":", 1)[1])
            continue
        if stripped.startswith("Description:"):
            model_description = unquote(stripped.split(":", 1)[1])
            continue

        match = RULE_RE.match(raw_line)
        if not match or not logical_name:
            continue
        indent = len(match.group(1).replace("\t", "  "))
        content = strip_comment(match.group(2))
        if not content:
            continue

        while stack and stack[-1][0] >= indent:
            stack.pop()

        insert = INSERT_RE.match(content)
        if insert:
            if not stack:
                raise SystemExit(f"Obligation insert without an element in {path}: {raw_line.strip()}")
            ruleset = rulesets.get(insert.group(1))
            if ruleset is None:
                continue
            actor_reference = resolve_alias(ruleset.actor_reference, aliases)
            actor = actors_by_reference.get(actor_reference) or actors_by_reference.get(ruleset.actor_reference)
            if actor is None:
                raise SystemExit(
                    f"RuleSet {ruleset.name} in {path} refers to unknown actor {ruleset.actor_reference}"
                )
            arguments = [part.strip() for part in insert.group(2).split(",")]
            obligation = ObligationEntry(
                code=format_template(ruleset.code_template, arguments),
                documentation=format_template(ruleset.documentation_template, arguments),
            )
            target = elements[stack[-1][1]]
            entries = target.obligations.setdefault(actor.url, [])
            if obligation not in entries:
                entries.append(obligation)
            continue

        if content.startswith("^"):
            if stack:
                apply_fsh_metadata(elements[stack[-1][1]], content)
            continue
        if content.startswith("insert "):
            continue

        token, *rest = content.split()
        if token.startswith("[") or token.startswith("="):
            continue
        parent_path = stack[-1][1] if stack else ""
        element_path = token if "." in token or not parent_path else f"{parent_path}.{token}"
        element = elements.get(element_path)
        if element is None:
            element = ParsedElement(path=element_path)
            elements[element_path] = element
        if rest and CARDINALITY_RE.match(rest[0]):
            element.cardinality = rest[0]
            type_expression = " ".join(rest[1:])
            if '"' in type_expression:
                type_expression = type_expression.split('"', 1)[0].strip()
            if type_expression:
                element.data_type = " or ".join(
                    display_type_code(part.strip()) for part in type_expression.split(" or ") if part.strip()
                )
        elif rest and rest[0] == "only":
            element.data_type = " or ".join(
                display_type_code(part.strip()) for part in " ".join(rest[1:]).split(" or ") if part.strip()
            )
        description = quoted_tail(content)
        if description:
            element.description = description
        metadata_index = content.find(" ^")
        if metadata_index >= 0:
            apply_fsh_metadata(element, content[metadata_index + 1 :])
        stack.append((indent, element_path))

    if not logical_name:
        return None
    model = LogicalModel(
        logical_name=logical_name,
        parent=parent_name,
        title=model_title,
        description=model_description,
    )
    return model, elements


def build_logical_models(
    parsed_models: list[tuple[LogicalModel, dict[str, ParsedElement]]], actors: list[Actor]
) -> list[LogicalModel]:
    by_name = {model.logical_name: (model, elements) for model, elements in parsed_models}
    def resolved_elements(model: LogicalModel, seen: set[str] | None = None) -> dict[str, ParsedElement]:
        seen = set(seen or set())
        if model.logical_name in seen:
            raise SystemExit(f"Cyclic Parent chain detected at {model.logical_name}")
        seen.add(model.logical_name)
        merged: dict[str, ParsedElement] = {}
        parent = by_name.get(model.parent)
        if parent:
            merged = {path_value: deepcopy(element) for path_value, element in resolved_elements(parent[0], seen).items()}
        for path_value, own in by_name[model.logical_name][1].items():
            if path_value not in merged:
                merged[path_value] = deepcopy(own)
                continue
            target = merged[path_value]
            for attribute in ("description", "data_type", "cardinality", "binding"):
                value = getattr(own, attribute)
                if value:
                    setattr(target, attribute, value)
            for actor_url, entries in own.obligations.items():
                target.obligations[actor_url] = deepcopy(entries)
        return merged

    result: list[LogicalModel] = []
    for model, _ in parsed_models:
        elements = filter_zero_cardinality_fsh_elements(resolved_elements(model))
        rows = [
            ObligationRow(
                level=0,
                name=model.logical_name,
                description=sentence_text(model.title),
                data_type=format_parent_data_type(model.parent),
                obligations={actor.url: [] for actor in actors},
            )
        ]
        for path_value in hierarchical_element_keys(elements):
            element = elements[path_value]
            rows.append(
                ObligationRow(
                    level=path_value.count(".") + 1,
                    name=sanitize_text(path_value.rsplit(".", 1)[-1]),
                    description=element.description,
                    data_type=element.data_type,
                    cardinality=element.cardinality,
                    binding=element.binding,
                    obligations={actor.url: list(element.obligations.get(actor.url, [])) for actor in actors},
                )
            )
        result.append(
            LogicalModel(
                logical_name=model.logical_name,
                parent=model.parent,
                title=model.title,
                description=model.description,
                elements=rows,
            )
        )
    return result


def set_repeat_table_header(row) -> None:
    tr_pr = row._tr.get_or_add_trPr()
    tbl_header = OxmlElement("w:tblHeader")
    tbl_header.set(qn("w:val"), "true")
    tr_pr.append(tbl_header)


def prevent_row_split(row) -> None:
    tr_pr = row._tr.get_or_add_trPr()
    cant_split = OxmlElement("w:cantSplit")
    tr_pr.append(cant_split)


def shade_cell(cell, fill: str) -> None:
    tc_pr = cell._tc.get_or_add_tcPr()
    shading = OxmlElement("w:shd")
    shading.set(qn("w:fill"), fill)
    tc_pr.append(shading)


def set_cell_width(cell, inches: float) -> None:
    tc_pr = cell._tc.get_or_add_tcPr()
    tc_w = tc_pr.find(qn("w:tcW"))
    if tc_w is None:
        tc_w = OxmlElement("w:tcW")
        tc_pr.append(tc_w)
    tc_w.set(qn("w:w"), str(int(inches * 1440)))
    tc_w.set(qn("w:type"), "dxa")


def set_cell_top_left(cell) -> None:
    cell.vertical_alignment = WD_ALIGN_VERTICAL.CENTER
    for paragraph in cell.paragraphs:
        paragraph.alignment = WD_PARAGRAPH_ALIGNMENT.LEFT


def get_page_fit_widths(document: Document, actor_count: int) -> list[float]:
    section = document.sections[-1]
    usable_width = (section.page_width - section.left_margin - section.right_margin) / 914400
    actor_widths = [TABLE_ACTOR_WIDTHS[index] if index < len(TABLE_ACTOR_WIDTHS) else TABLE_ACTOR_WIDTHS[-1] for index in range(actor_count)]
    requested_widths = TABLE_BASE_WIDTHS + actor_widths
    base_total = sum(requested_widths)
    scale = usable_width / base_total
    return [width * scale for width in requested_widths]


def add_row(table, widths: list[float], values: list[str]) -> None:
    row = table.add_row()
    prevent_row_split(row)
    for index, value in enumerate(values):
        cell = row.cells[index]
        set_cell_width(cell, widths[index])
        cell.text = value
        set_cell_top_left(cell)


def format_relevance(entries: list[ObligationEntry]) -> str:
    values: list[str] = []
    for entry in entries:
        value = entry.code.split(":", 1)[0]
        if value and value not in values:
            values.append(value)
    return "\n".join(values)


def add_obligation_row(table, widths: list[float], element: ObligationRow, actors: list[Actor]) -> None:
    values = [
        "+" * element.level,
        element.name,
        element.description,
        element.data_type,
        element.cardinality,
        element.binding,
    ]
    values.extend(format_relevance(element.obligations.get(actor.url, [])) for actor in actors)
    add_row(table, widths, values)


def add_model_table(document: Document, model: LogicalModel, actors: list[Actor], table_number: int) -> None:
    heading = document.add_heading(f"Table {table_number}. {model.logical_name}.", level=3)
    heading.alignment = WD_PARAGRAPH_ALIGNMENT.CENTER
    if model.description:
        document.add_paragraph(model.description)

    table = document.add_table(rows=1, cols=6 + len(actors))
    table.style = "Table Grid"
    table.alignment = WD_TABLE_ALIGNMENT.CENTER
    table.autofit = False

    widths = get_page_fit_widths(document, len(actors))
    for index, width in enumerate(widths):
        table.columns[index].width = Inches(width)
    headers = [
        "Level",
        "Element Name",
        "Element Description",
        "Data type",
        "Cardinality",
        "Binding requirements",
    ]
    for actor in actors:
        headers.append(f"Relevance for support level “{actor.display.lower()}”")

    header_row = table.rows[0]
    set_repeat_table_header(header_row)
    prevent_row_split(header_row)
    for index, heading in enumerate(headers):
        cell = header_row.cells[index]
        set_cell_width(cell, widths[index])
        shade_cell(cell, HEADER_FILL)
        paragraph = cell.paragraphs[0]
        paragraph.alignment = WD_PARAGRAPH_ALIGNMENT.LEFT
        run = paragraph.add_run(heading)
        run.bold = True
        set_cell_top_left(cell)

    for element in model.elements:
        add_obligation_row(table, widths, element, actors)


def build_document(models: list[LogicalModel], actors: list[Actor], output_path: Path) -> None:
    document = Document()
    section = document.sections[0]
    section.orientation = WD_ORIENT.LANDSCAPE
    section.page_width = Mm(297)
    section.page_height = Mm(210)
    section.left_margin = Inches(1)
    section.right_margin = Inches(1)
    section.top_margin = Inches(1)
    section.bottom_margin = Inches(1)

    normal_style = document.styles["Normal"]
    normal_style.font.name = "Times New Roman"
    normal_style.font.size = Pt(11)

    for index, model in enumerate(models, start=1):
        if index > 1:
            document.add_page_break()
        add_model_table(document, model, actors, index)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    document.save(output_path)


def main() -> int:
    args = parse_args()
    project_dir = Path(__file__).resolve().parent.parent

    def project_path(value: str) -> Path:
        path = Path(value).expanduser()
        if path.is_absolute() or path.exists():
            return path
        return project_dir / path

    default_input = "input/fsh/EHDS-models" if args.source_format == "fsh" else "fsh-generated/resources"
    input_path = project_path(args.input_path or args.input or default_input)
    actors_path = project_path(args.actors)
    rulesets_path = project_path(args.rulesets)
    output_path = Path(args.output).expanduser()
    if not output_path.is_absolute():
        output_path = project_dir / output_path

    alias_candidates = [actors_path, rulesets_path]
    conventional_alias_file = actors_path.parent.parent / "alias.fsh"
    alias_candidates.append(conventional_alias_file)
    aliases = read_aliases(alias_candidates)
    actors = parse_actors(actors_path, aliases)
    actors_by_reference: dict[str, Actor] = {}
    for actor in actors:
        for reference in (actor.url, actor.id, actor.name):
            if reference:
                actors_by_reference[reference] = actor
    rulesets = parse_rulesets(rulesets_path)

    selected_files = list(iter_input_files(input_path, args.source_format))
    context_dir = input_path.parent if input_path.is_file() else input_path
    context_files = list(iter_input_files(context_dir, args.source_format))
    input_format = selected_files[0].suffix.lower() if selected_files else ""
    if input_format == ".json":
        repository = build_structure_definition_repository(context_files)
        fsh_metadata_by_name = load_fsh_model_metadata(project_dir / "input/fsh/EHDS-models")
        models = []
        for file_path in selected_files:
            model = parse_structure_obligations(file_path, repository, actors, fsh_metadata_by_name)
            if model is not None:
                models.append(model)
    else:
        parsed_by_path: dict[Path, tuple[LogicalModel, dict[str, ParsedElement]]] = {}
        for file_path in context_files:
            parsed = parse_logical_model(file_path, rulesets, actors_by_reference, aliases)
            if parsed is not None:
                parsed_by_path[file_path.resolve()] = parsed

        selected_names = {
            parsed_by_path[path.resolve()][0].logical_name
            for path in selected_files
            if path.resolve() in parsed_by_path
        }
        all_models = build_logical_models(list(parsed_by_path.values()), actors)
        models = [model for model in all_models if model.logical_name in selected_names]

    if not models:
        raise SystemExit(f"No logical models found in {input_path}")

    if args.expand_variants:
        models = expand_polymorphic_rows(models, args.model_slice_name_only)

    build_document(models, actors, output_path)
    print(
        f"Created {output_path} from {len(models)} logical model(s) "
        f"and {len(actors)} actor definition(s)."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
