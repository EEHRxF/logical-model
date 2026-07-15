#!/usr/bin/env python3
"""Highlight table-content differences between two obligations DOCX files."""

from __future__ import annotations

import argparse
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

from docx import Document
from docx.document import Document as DocumentType
from docx.table import _Cell, Table, _Row
from docx.oxml import OxmlElement
from docx.oxml.ns import qn


CHANGED_FILL = "FFF2CC"
OUTPUT_ONLY_FILL = "F4CCCC"
REFERENCE_ONLY_FILL = "DDEBF7"


@dataclass
class TableData:
    table: Table
    headers: list[str]
    rows: dict[tuple[tuple[str, ...], int], _Row]
    paths: dict[tuple[tuple[str, ...], int], tuple[str, ...]]


def normalize(value: str) -> str:
    return value.replace("\u200b", "").strip()


def normalized_header(value: str) -> str:
    return normalize(value).casefold().replace("“", '"').replace("”", '"')


def header_indexes(headers: list[str]) -> dict[str, int]:
    """Map duplicate headers to their first physical column."""
    result: dict[str, int] = {}
    for index, value in enumerate(headers):
        result.setdefault(normalized_header(value), index)
    return result


def normalized_model_name(value: str) -> str:
    value = normalize(value).casefold()
    return value[4:] if value.startswith("ehds") else value


def row_path(level: str, name: str, stack: list[str]) -> tuple[str, ...]:
    depth = normalize(level).count("+")
    if depth == 0:
        stack[:] = [name]
    else:
        stack[:] = stack[:depth]
        stack.append(name)
    return tuple(stack)


def extract_model_tables(document: DocumentType) -> dict[str, TableData]:
    result: dict[str, TableData] = {}
    for table in document.tables:
        if len(table.rows) < 2:
            continue
        headers = [normalize(cell.text) for cell in table.rows[0].cells]
        header_map = header_indexes(headers)
        if "level" not in header_map or "element name" not in header_map:
            continue

        level_index = header_map["level"]
        name_index = header_map["element name"]
        data_type_index = header_map.get("data type")
        model = ""
        stack: list[str] = []
        occurrences: Counter[tuple[str, ...]] = Counter()
        rows: dict[tuple[tuple[str, ...], int], _Row] = {}
        paths: dict[tuple[tuple[str, ...], int], tuple[str, ...]] = {}

        for row_number, row in enumerate(table.rows[1:], start=1):
            values = [normalize(cell.text) for cell in row.cells]
            if max(level_index, name_index) >= len(values):
                continue
            name = values[name_index]
            if not name:
                continue
            path = row_path(values[level_index], name, stack)
            canonical_path = tuple(
                normalized_model_name(part) if index == 0 else part.casefold()
                for index, part in enumerate(path)
            )
            occurrences[canonical_path] += 1
            key = (canonical_path, occurrences[canonical_path])
            rows[key] = row
            paths[key] = path
            if (
                row_number == 1
                and not values[level_index]
                and re.fullmatch(r"[A-Za-z][A-Za-z0-9_-]*", name)
            ):
                data_type = values[data_type_index] if data_type_index is not None else ""
                normalized_type = data_type.casefold()
                if (
                    name.casefold().startswith("ehds")
                    or normalized_type == "base"
                    or "derived from" in normalized_type
                    or "based on parent" in normalized_type
                ):
                    model = name

        if model:
            result[model] = TableData(table, headers, rows, paths)
    return result


def shade_cell(cell: _Cell, fill: str) -> None:
    properties = cell._tc.get_or_add_tcPr()
    shading = properties.find(qn("w:shd"))
    if shading is None:
        shading = OxmlElement("w:shd")
        properties.append(shading)
    shading.set(qn("w:fill"), fill)


def shade_row(row: _Row, fill: str) -> None:
    for cell in row.cells:
        shade_cell(cell, fill)


def cell_value(row: _Row, index: int) -> str:
    return normalize(row.cells[index].text) if index < len(row.cells) else ""


def path_text(key: tuple[tuple[str, ...], int]) -> str:
    path, occurrence = key
    suffix = f" [{occurrence}]" if occurrence > 1 else ""
    return ".".join(path) + suffix


def display_path(data: TableData, key: tuple[tuple[str, ...], int]) -> str:
    return path_text((data.paths[key], key[1]))


def add_summary_row(table: Table, values: list[str], fill: str) -> None:
    cells = table.add_row().cells
    for index, value in enumerate(values):
        cells[index].text = value
        shade_cell(cells[index], fill)


def compare(output_path: Path, reference_path: Path, destination: Path) -> dict[str, int]:
    output_document = Document(output_path)
    reference_document = Document(reference_path)
    output_tables = extract_model_tables(output_document)
    reference_tables = extract_model_tables(reference_document)
    reference_by_name = {
        name.casefold(): (name, data) for name, data in reference_tables.items()
    }
    reference_without_prefix: dict[str, tuple[str, TableData] | None] = {}
    for name, data in reference_tables.items():
        key = normalized_model_name(name)
        reference_without_prefix[key] = (
            None if key in reference_without_prefix else (name, data)
        )
    matched_reference_names: set[str] = set()
    matched_reference_models: set[str] = set()

    differences: list[tuple[str, str, str, str, str, str, str]] = []
    counts = Counter()

    for model, output_data in output_tables.items():
        reference_match = reference_by_name.get(model.casefold())
        if reference_match is None:
            reference_match = reference_without_prefix.get(normalized_model_name(model))
        if reference_match is None:
            for row in output_data.table.rows:
                shade_row(row, OUTPUT_ONLY_FILL)
            counts["output_only_tables"] += 1
            differences.append((OUTPUT_ONLY_FILL, "Table only in output", model, "", "", "present", "missing"))
            continue
        reference_name, reference_data = reference_match
        matched_reference_names.add(reference_name.casefold())
        matched_reference_models.add(normalized_model_name(reference_name))

        output_headers = header_indexes(output_data.headers)
        reference_headers = header_indexes(reference_data.headers)

        for key, output_row in output_data.rows.items():
            reference_row = reference_data.rows.get(key)
            if reference_row is None:
                shade_row(output_row, OUTPUT_ONLY_FILL)
                counts["output_only_rows"] += 1
                differences.append((OUTPUT_ONLY_FILL, "Row only in output", model, display_path(output_data, key), "", "present", "missing"))
                continue

            for header, output_index in output_headers.items():
                reference_index = reference_headers.get(header)
                output_value = cell_value(output_row, output_index)
                reference_value = cell_value(reference_row, reference_index) if reference_index is not None else ""
                if output_value != reference_value:
                    shade_cell(output_row.cells[output_index], CHANGED_FILL)
                    counts["changed_cells"] += 1
                    differences.append(
                        (
                            CHANGED_FILL,
                            "Changed cell",
                            model,
                            display_path(output_data, key),
                            output_data.headers[output_index],
                            output_value,
                            reference_value,
                        )
                    )

        for key in reference_data.rows.keys() - output_data.rows.keys():
            counts["reference_only_rows"] += 1
            differences.append((REFERENCE_ONLY_FILL, "Row only in reference", model, display_path(reference_data, key), "", "missing", "present"))

    for model in (
        name
        for name in reference_tables
        if name.casefold() not in matched_reference_names
        and normalized_model_name(name) not in matched_reference_models
    ):
        counts["reference_only_tables"] += 1
        differences.append((REFERENCE_ONLY_FILL, "Table only in reference", model, "", "", "missing", "present"))

    output_document.add_page_break()
    output_document.add_heading("Comparison summary", level=1)
    output_document.add_paragraph(
        "Yellow = changed cell; red = content only in the output document; "
        "blue = content only in the reference document. Existing highlighting in the reference was ignored."
    )
    summary = output_document.add_table(rows=1, cols=6)
    summary.style = "Table Grid"
    for cell, value in zip(
        summary.rows[0].cells,
        ["Difference", "Model", "Element", "Column", "Output value", "Reference value"],
    ):
        cell.text = value

    if differences:
        for fill, kind, model, element, column, output_value, reference_value in differences:
            add_summary_row(summary, [kind, model, element, column, output_value, reference_value], fill)
    else:
        add_summary_row(summary, ["No differences", "", "", "", "", ""], CHANGED_FILL)

    destination.parent.mkdir(parents=True, exist_ok=True)
    output_document.save(destination)
    counts["output_tables"] = len(output_tables)
    counts["reference_tables"] = len(reference_tables)
    counts["differences"] = len(differences)
    return dict(counts)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output_document", type=Path)
    parser.add_argument("reference_document", type=Path)
    parser.add_argument("-o", "--destination", required=True, type=Path)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    counts = compare(args.output_document, args.reference_document, args.destination)
    print(" ".join(f"{key}={value}" for key, value in sorted(counts.items())))


if __name__ == "__main__":
    main()
