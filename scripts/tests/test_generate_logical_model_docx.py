import json
import sys
import tempfile
import unittest
from copy import deepcopy
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import generate_logical_model_docx as generator


class LogicalModelTablesTest(unittest.TestCase):
    def test_nearest_description_across_multiple_generations(self):
        base = [{"path": "Base.status", "short": "Base short", "definition": "Base definition"}]
        child = [{"path": "Child.status", "short": "Child short"}]
        original = deepcopy((base, child))
        merged = generator.merge_elements(base, child)
        self.assertEqual(generator.format_description(merged[0]), "Child short")
        # A cardinality-only change must retain the child's chosen text.
        merged = generator.merge_elements(merged, [{"path": "Grandchild.status", "min": 1}])
        self.assertEqual(generator.format_description(merged[0]), "Child short")
        merged = generator.merge_elements(merged, [{"path": "Leaf.status", "definition": "Leaf definition"}])
        self.assertEqual(generator.format_description(merged[0]), "Leaf definition")
        self.assertEqual((base, child), original)

    def test_local_definition_wins_over_local_short(self):
        merged = generator.merge_elements([], [{
            "path": "Model.status", "short": "Brief", "definition": "Detailed",
        }])
        self.assertEqual(generator.format_description(merged[0]), "Detailed")

    def test_blank_local_description_keeps_inherited_text(self):
        merged = generator.merge_elements(
            [{"path": "Base.status", "definition": "Inherited"}],
            [{"path": "Child.status", "short": "  "}],
        )
        self.assertEqual(generator.format_description(merged[0]), "Inherited")

    def test_prohibited_elements_and_descendants_with_inherited_paths(self):
        with tempfile.TemporaryDirectory() as directory:
            directory = Path(directory)
            base = {
                "resourceType": "StructureDefinition", "id": "Base", "kind": "logical",
                "differential": {"element": [
                    {"path": "Base.group", "min": 0, "max": "1"},
                    {"path": "Base.group.child", "min": 0, "max": "1"},
                    {"path": "Base.group.child.leaf", "min": 0, "max": "1"},
                    {"path": "Base.groupOther", "min": 0, "max": "1"},
                    {"path": "Base.groupOther.child", "min": 0, "max": "1"},
                ]},
            }
            child = {
                "resourceType": "StructureDefinition", "id": "Child", "kind": "logical",
                "baseDefinition": "Base",
                "differential": {"element": [{"path": "Child.group", "max": "0"}]},
            }
            for obj in [base, child]:
                (directory / f"StructureDefinition-{obj['id']}.json").write_text(json.dumps(obj))
            repository = generator.build_repository(directory)
            model = generator.parse_structure_definition(directory / "StructureDefinition-Child.json", repository)
            self.assertEqual([(r.level, r.name) for r in model.elements], [
                (1, "groupOther"), (2, "child"),
            ])
            self.assertTrue(all(r.cardinality != "0..0" for r in model.elements))


if __name__ == "__main__":
    unittest.main()
