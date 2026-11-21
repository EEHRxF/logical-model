# Medication administration model - EHDS Logical Information Models v0.3.0

## Logical Model: Medication administration model 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication use model](StructureDefinition-EHDSMedicationUse.md) and [Service request model](StructureDefinition-EHDSServiceRequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedicationAdministration.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedicationAdministration.csv), [Excel](../StructureDefinition-EHDSMedicationAdministration.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedicationAdministration",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationAdministration",
  "version" : "0.3.0",
  "name" : "EHDSMedicationAdministration",
  "title" : "Medication administration model",
  "status" : "draft",
  "date" : "2026-11-21T16:14:41+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSMedicationAdministration means a structured set of data elements describing a single instance of the administration of a medicinal product in the context of an imaging or laboratory procedure.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationAdministration",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedicationAdministration",
      "path" : "EHDSMedicationAdministration",
      "short" : "Medication administration model",
      "definition" : "EHDSMedicationAdministration means a structured set of data elements describing a single instance of the administration of a medicinal product in the context of an imaging or laboratory procedure."
    },
    {
      "id" : "EHDSMedicationAdministration.header.identifier",
      "path" : "EHDSMedicationAdministration.header.identifier",
      "short" : "Business identifier for the object, unique within its system."
    },
    {
      "id" : "EHDSMedicationAdministration.header.version",
      "path" : "EHDSMedicationAdministration.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSMedicationAdministration.header.author[x]",
      "path" : "EHDSMedicationAdministration.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSMedicationAdministration.header.date",
      "path" : "EHDSMedicationAdministration.header.date",
      "short" : "Date and optionally time of authoring/issuing."
    },
    {
      "id" : "EHDSMedicationAdministration.header.status",
      "path" : "EHDSMedicationAdministration.header.status",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Medication Administration Status Codes"
      }
    },
    {
      "id" : "EHDSMedicationAdministration.medication",
      "path" : "EHDSMedicationAdministration.medication",
      "short" : "Administered medicinal product.",
      "definition" : "Administered medicinal product.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSMedicationAdministration.occurrence[x]",
      "path" : "EHDSMedicationAdministration.occurrence[x]",
      "short" : "Specific date/time or interval of time during which the administration took place (or did not take place).",
      "definition" : "Specific date/time or interval of time during which the administration took place (or did not take place).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSMedicationAdministration.reason[x]",
      "path" : "EHDSMedicationAdministration.reason[x]",
      "short" : "Condition or observation that supports why the medicinal product was administered.",
      "definition" : "Condition or observation that supports why the medicinal product was administered.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10, Orphacode"
      }
    },
    {
      "id" : "EHDSMedicationAdministration.dosage",
      "path" : "EHDSMedicationAdministration.dosage",
      "short" : "Details of how medicinal product was taken/administered.",
      "definition" : "Details of how medicinal product was taken/administered.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAdministeredDosage"
      }]
    },
    {
      "id" : "EHDSMedicationAdministration.note",
      "path" : "EHDSMedicationAdministration.note",
      "short" : "Textual information about the administration.",
      "definition" : "Textual information about the administration.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
