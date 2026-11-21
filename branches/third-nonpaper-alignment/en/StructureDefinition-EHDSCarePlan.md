# Care plan model - EHDS Logical Information Models v0.3.0

## Logical Model: Care plan model 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Encounter model](StructureDefinition-EHDSEncounter.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSCarePlan.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSCarePlan.csv), [Excel](../StructureDefinition-EHDSCarePlan.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSCarePlan",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCarePlan",
  "version" : "0.3.0",
  "name" : "EHDSCarePlan",
  "title" : "Care plan model",
  "status" : "draft",
  "date" : "2026-11-17T22:01:05+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSCarePlan means a structured set of data elements describing the intended management of a patient's health conditions but excluding pharmacological treatment plans that are represented through medication model.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCarePlan",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSCarePlan",
      "path" : "EHDSCarePlan",
      "short" : "Care plan model",
      "definition" : "EHDSCarePlan means a structured set of data elements describing the intended management of a patient's health conditions but excluding pharmacological treatment plans that are represented through medication model."
    },
    {
      "id" : "EHDSCarePlan.header.identifier",
      "path" : "EHDSCarePlan.header.identifier",
      "short" : "Identifier for the care plan."
    },
    {
      "id" : "EHDSCarePlan.header.status",
      "path" : "EHDSCarePlan.header.status",
      "definition" : "Indicates whether the plan is currently being acted upon, represents future intentions, or is now a historical record.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Request Status"
      }
    },
    {
      "id" : "EHDSCarePlan.title",
      "path" : "EHDSCarePlan.title",
      "short" : "Human-friendly name for the care plan.",
      "definition" : "Human-friendly name for the care plan.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSCarePlan.description",
      "path" : "EHDSCarePlan.description",
      "short" : "A description of the scope and nature of the plan.",
      "definition" : "A description of the scope and nature of the plan.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSCarePlan.period",
      "path" : "EHDSCarePlan.period",
      "short" : "Indicates when the plan did (or is intended to) come into effect and end.",
      "definition" : "Indicates when the plan did (or is intended to) come into effect and end.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSCarePlan.conditionAddressed[x]",
      "path" : "EHDSCarePlan.conditionAddressed[x]",
      "short" : "Conditions/problems/concerns/diagnoses/etc whose management and/or mitigation are handled by this plan.",
      "definition" : "Conditions/problems/concerns/diagnoses/etc whose management and/or mitigation are handled by this plan.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10, Orphacode"
      }
    },
    {
      "id" : "EHDSCarePlan.activity[x]",
      "path" : "EHDSCarePlan.activity[x]",
      "short" : "The details of the proposed activity represented in a specific resource.",
      "definition" : "The details of the proposed activity represented in a specific resource.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSCarePlan.goal[x]",
      "path" : "EHDSCarePlan.goal[x]",
      "short" : "Describes the intended objective of carrying out the care plan.",
      "definition" : "Describes the intended objective of carrying out the care plan.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    }]
  }
}

```
