# Condition model - EHDS Logical Information Models v0.3.0

## Logical Model: Condition model 

**Usages:**

* Use this Logical Model: [Care plan model](StructureDefinition-EHDSCarePlan.md), [Device use model](StructureDefinition-EHDSDeviceUse.md), [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Encounter model](StructureDefinition-EHDSEncounter.md)... Show 6 more, [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication administration model](StructureDefinition-EHDSMedicationAdministration.md), [Patient summary model](StructureDefinition-EHDSPatientSummary.md), [Procedure model](StructureDefinition-EHDSProcedure.md) and [Service request model](StructureDefinition-EHDSServiceRequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSCondition.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSCondition.csv), [Excel](../StructureDefinition-EHDSCondition.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSCondition",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition",
  "version" : "0.3.0",
  "name" : "EHDSCondition",
  "title" : "Condition model",
  "status" : "draft",
  "date" : "2026-11-20T11:33:53+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSCondition means a structured set of data elements describing a clinical condition, problem, or diagnosis.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSCondition",
      "path" : "EHDSCondition",
      "short" : "Condition model",
      "definition" : "EHDSCondition means a structured set of data elements describing a clinical condition, problem, or diagnosis."
    },
    {
      "id" : "EHDSCondition.header.identifier",
      "path" : "EHDSCondition.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSCondition.header.version",
      "path" : "EHDSCondition.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSCondition.header.author[x]",
      "path" : "EHDSCondition.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSCondition.header.status",
      "path" : "EHDSCondition.header.status",
      "short" : "Status of the condition/problem, e.g. active, resolved, inactive.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Condition Clinical Status Codes"
      }
    },
    {
      "id" : "EHDSCondition.code",
      "path" : "EHDSCondition.code",
      "short" : "Code identifying the condition, problem or diagnosis.",
      "definition" : "Code identifying the condition, problem or diagnosis.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10, ICD-O, Orphacode"
      }
    },
    {
      "id" : "EHDSCondition.onsetDate",
      "path" : "EHDSCondition.onsetDate",
      "short" : "Estimated or actual date the problem/condition began.",
      "definition" : "Estimated or actual date the problem/condition began.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSCondition.endDate",
      "path" : "EHDSCondition.endDate",
      "short" : "The date or estimated date that the condition resolved or went into remission.",
      "definition" : "The date or estimated date that the condition resolved or went into remission.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSCondition.category",
      "path" : "EHDSCondition.category",
      "short" : "Category of the problem (e.g. POA – present on admission, hospital-acquired condition (HAC) and other categorisations).",
      "definition" : "Category of the problem (e.g. POA – present on admission, hospital-acquired condition (HAC) and other categorisations).",
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
      "id" : "EHDSCondition.resolutionCircumstances",
      "path" : "EHDSCondition.resolutionCircumstances",
      "short" : "Describes the reason for which the status of the problem changed from current to inactive (e.g. surgical procedure, medical treatment).",
      "definition" : "Describes the reason for which the status of the problem changed from current to inactive (e.g. surgical procedure, medical treatment).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSCondition.severity",
      "path" : "EHDSCondition.severity",
      "short" : "A subjective assessment of the severity of the condition.",
      "definition" : "A subjective assessment of the severity of the condition.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSCondition.bodySite",
      "path" : "EHDSCondition.bodySite",
      "short" : "The anatomical location including laterality where this condition manifests itself.",
      "definition" : "The anatomical location including laterality where this condition manifests itself.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSCondition.stage",
      "path" : "EHDSCondition.stage",
      "short" : "Stage or grade, usually assessed formally using a specific staging, grading or classification system, such as Tumor, Node, Metastasis (TNM), International Classification of Diseases for Oncology (ICD-O) or Breast Imaging Reporting and Data Systems (BI-RADS). Multiple assessment systems may be used.",
      "definition" : "Stage or grade, usually assessed formally using a specific staging, grading or classification system, such as Tumor, Node, Metastasis (TNM), International Classification of Diseases for Oncology (ICD-O) or Breast Imaging Reporting and Data Systems (BI-RADS). Multiple assessment systems may be used.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSCondition.diagnosisAssertionStatus",
      "path" : "EHDSCondition.diagnosisAssertionStatus",
      "short" : "Assertion about the certainty associated with a diagnosis. Evidence of condition (diagnostic, clinical or both).",
      "definition" : "Assertion about the certainty associated with a diagnosis. Evidence of condition (diagnostic, clinical or both).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Condition Verification Status"
      }
    },
    {
      "id" : "EHDSCondition.specialistContact",
      "path" : "EHDSCondition.specialistContact",
      "short" : "Health professional who may be specifically related to the problem, as a preferred contact.",
      "definition" : "Health professional who may be specifically related to the problem, as a preferred contact.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      }]
    },
    {
      "id" : "EHDSCondition.externalResource",
      "path" : "EHDSCondition.externalResource",
      "short" : "External resource which may be specifically related to the problem, for example a link to a guideline on a specific rare disease problem.",
      "definition" : "External resource which may be specifically related to the problem, for example a link to a guideline on a specific rare disease problem.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSCondition.note",
      "path" : "EHDSCondition.note",
      "short" : "Free text note by the health professional.",
      "definition" : "Free text note by the health professional.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
