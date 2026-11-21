# Allergy intolerance model - EHDS Logical Information Models v0.3.0

## Logical Model: Allergy intolerance model 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSAllergyIntolerance.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSAllergyIntolerance.csv), [Excel](../StructureDefinition-EHDSAllergyIntolerance.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSAllergyIntolerance",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAllergyIntolerance",
  "version" : "0.3.0",
  "name" : "EHDSAllergyIntolerance",
  "title" : "Allergy intolerance model",
  "status" : "draft",
  "date" : "2026-11-18T22:38:10+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSAllergyIntolerance means a structured set of data elements describing a clinically identified predisposition of a patient to an adverse reaction upon exposure to a specific agent or allergen.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAllergyIntolerance",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSAllergyIntolerance",
      "path" : "EHDSAllergyIntolerance",
      "short" : "Allergy intolerance model",
      "definition" : "EHDSAllergyIntolerance means a structured set of data elements describing a clinically identified predisposition of a patient to an adverse reaction upon exposure to a specific agent or allergen."
    },
    {
      "id" : "EHDSAllergyIntolerance.header.identifier",
      "path" : "EHDSAllergyIntolerance.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSAllergyIntolerance.header.author[x]",
      "path" : "EHDSAllergyIntolerance.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSAllergyIntolerance.header.status",
      "path" : "EHDSAllergyIntolerance.header.status",
      "short" : "Current status of the allergy or intolerance, for example whether it is active, inactive or resolved.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 AllergyIntolerance Clinical Status Codes"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.agentOrAllergen",
      "path" : "EHDSAllergyIntolerance.agentOrAllergen",
      "short" : "Code that identifies the substance, pharmaceutical product or group of medications the person is allergic or intolerant to.",
      "definition" : "Code that identifies the substance, pharmaceutical product or group of medications the person is allergic or intolerant to.",
      "comment" : "Code for an allergy or intolerance statement (either a positive or a negated/excluded statement). This may be a code for a substance or pharmaceutical product that is considered to be responsible for the adverse reaction risk (e.g., Latex), an allergy or intolerance condition (e.g., Latex allergy), or a negated/excluded code for a specific substance or class (e.g., No latex allergy). It must be clinically safe to only process the 'code' and ignore the 'reaction.substance'.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.note",
      "path" : "EHDSAllergyIntolerance.note",
      "short" : "Free text notes by the health professional.",
      "definition" : "Free text notes by the health professional.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAllergyIntolerance.criticality",
      "path" : "EHDSAllergyIntolerance.criticality",
      "short" : "Estimate of the potential clinical harm, or seriousness, of a reaction to an identified substance.",
      "definition" : "Estimate of the potential clinical harm, or seriousness, of a reaction to an identified substance.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Allergy Intolerance Criticality"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.certainty",
      "path" : "EHDSAllergyIntolerance.certainty",
      "short" : "Assertion about the certainty associated with a propensity, or potential risk, of a reaction to the identified substance. Evidence of condition (diagnostic, clinical or both).",
      "definition" : "Assertion about the certainty associated with a propensity, or potential risk, of a reaction to the identified substance. Evidence of condition (diagnostic, clinical or both).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Allergy Intolerance Verification Status Codes"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.onsetDate",
      "path" : "EHDSAllergyIntolerance.onsetDate",
      "short" : "When allergy or intolerance was identified.",
      "definition" : "When allergy or intolerance was identified.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSAllergyIntolerance.endDate",
      "path" : "EHDSAllergyIntolerance.endDate",
      "short" : "Date of resolution of the allergy or intolerance (e.g. when the clinician deemed that there is no longer any need to track the underlying condition).",
      "definition" : "Date of resolution of the allergy or intolerance (e.g. when the clinician deemed that there is no longer any need to track the underlying condition).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSAllergyIntolerance.reaction",
      "path" : "EHDSAllergyIntolerance.reaction",
      "short" : "Adverse reaction events linked to exposure to substance.",
      "definition" : "Adverse reaction events linked to exposure to substance.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSAllergyIntolerance.reaction.substance",
      "path" : "EHDSAllergyIntolerance.reaction.substance",
      "short" : "Specific substance or pharmaceutical product considered responsible for the reaction episode in which the allergy or intolerance was detected.",
      "definition" : "Specific substance or pharmaceutical product considered responsible for the reaction episode in which the allergy or intolerance was detected.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.reaction.manifestation",
      "path" : "EHDSAllergyIntolerance.reaction.manifestation",
      "short" : "Description of the clinical manifestation of the allergic reaction.",
      "definition" : "Description of the clinical manifestation of the allergic reaction.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.reaction.severity",
      "path" : "EHDSAllergyIntolerance.reaction.severity",
      "short" : "Severity of the clinical manifestation of the allergic reaction.",
      "definition" : "Severity of the clinical manifestation of the allergic reaction.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 AllergyIntolerance Severity"
      }
    },
    {
      "id" : "EHDSAllergyIntolerance.reaction.onset",
      "path" : "EHDSAllergyIntolerance.reaction.onset",
      "short" : "Date and time of the onset of the reaction.",
      "definition" : "Date and time of the onset of the reaction.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
