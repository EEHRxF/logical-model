# Medication use model - EHDS Logical Information Models v0.3.0

## Logical Model: Medication use model 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedicationUse.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedicationUse.csv), [Excel](../StructureDefinition-EHDSMedicationUse.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedicationUse",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationUse",
  "version" : "0.3.0",
  "name" : "EHDSMedicationUse",
  "title" : "Medication use model",
  "status" : "draft",
  "date" : "2026-11-20T11:39:05+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSMedicationUse means a structured set of data elements describing a use of a single medicinal product as part of a medication summary.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationUse",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedicationUse",
      "path" : "EHDSMedicationUse",
      "short" : "Medication use model",
      "definition" : "EHDSMedicationUse means a structured set of data elements describing a use of a single medicinal product as part of a medication summary."
    },
    {
      "id" : "EHDSMedicationUse.header.identifier",
      "path" : "EHDSMedicationUse.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSMedicationUse.header.version",
      "path" : "EHDSMedicationUse.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSMedicationUse.header.author[x]",
      "path" : "EHDSMedicationUse.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSMedicationUse.header.status",
      "path" : "EHDSMedicationUse.header.status",
      "short" : "Status of the medicinal product use statement, e.g. ‘recorded’.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Medication Status Codes"
      }
    },
    {
      "id" : "EHDSMedicationUse.medication",
      "path" : "EHDSMedicationUse.medication",
      "short" : "Describes the medicinal product.",
      "definition" : "Describes the medicinal product.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSMedicationUse.reason[x]",
      "path" : "EHDSMedicationUse.reason[x]",
      "short" : "Reason for the use of the medicinal product (typically diagnosis or a procedure).",
      "definition" : "Reason for the use of the medicinal product (typically diagnosis or a procedure).",
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
        "description" : "SNOMED GPS (preferred), ICD-10, Orphacode"
      }
    },
    {
      "id" : "EHDSMedicationUse.dosageInstructions",
      "path" : "EHDSMedicationUse.dosageInstructions",
      "short" : "Details of how medicinal product is / was / shall be taken.",
      "definition" : "Details of how medicinal product is / was / shall be taken.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDosage"
      }]
    },
    {
      "id" : "EHDSMedicationUse.periodOfUse",
      "path" : "EHDSMedicationUse.periodOfUse",
      "short" : "Period when the patient took, is taking or is required to take the medicinal product.",
      "definition" : "Period when the patient took, is taking or is required to take the medicinal product.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSMedicationUse.derivedFrom[x]",
      "path" : "EHDSMedicationUse.derivedFrom[x]",
      "short" : "Prescriptions, dispensations or administrations that are the basis of this medicinal product use statement.",
      "definition" : "Prescriptions, dispensations or administrations that are the basis of this medicinal product use statement.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationPrescription"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationDispense"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationAdministration"
      }]
    },
    {
      "id" : "EHDSMedicationUse.note",
      "path" : "EHDSMedicationUse.note",
      "short" : "Additional information about the medicinal product use statement.",
      "definition" : "Additional information about the medicinal product use statement.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
