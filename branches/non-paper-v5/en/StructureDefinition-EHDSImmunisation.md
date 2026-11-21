# Immunisation model - EHDS Logical Information Models v0.3.0

## Logical Model: Immunisation model 

**Usages:**

* Use this Logical Model: [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSImmunisation.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSImmunisation.csv), [Excel](../StructureDefinition-EHDSImmunisation.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSImmunisation",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation",
  "version" : "0.3.0",
  "name" : "EHDSImmunisation",
  "title" : "Immunisation model",
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
  "description" : "EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSImmunisation",
      "path" : "EHDSImmunisation",
      "short" : "Immunisation model",
      "definition" : "EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning."
    },
    {
      "id" : "EHDSImmunisation.header.identifier",
      "path" : "EHDSImmunisation.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSImmunisation.header.author[x]",
      "path" : "EHDSImmunisation.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSImmunisation.header.status",
      "path" : "EHDSImmunisation.header.status",
      "short" : "Status of the immunisation event, e.g. completed, not done.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Immunization Status Codes"
      }
    },
    {
      "id" : "EHDSImmunisation.diseaseOrAgentTargeted",
      "path" : "EHDSImmunisation.diseaseOrAgentTargeted",
      "short" : "Disease or agent that the vaccination provides protection against.",
      "definition" : "Disease or agent that the vaccination provides protection against.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10"
      }
    },
    {
      "id" : "EHDSImmunisation.vaccine",
      "path" : "EHDSImmunisation.vaccine",
      "short" : "Type of immunisation.",
      "definition" : "Type of immunisation.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "WHO ATC, SNOMED GPS (preferred)"
      }
    },
    {
      "id" : "EHDSImmunisation.administeredProduct",
      "path" : "EHDSImmunisation.administeredProduct",
      "short" : "Administered medicinal product, including batch/lot details",
      "definition" : "Administered medicinal product, including batch/lot details",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSImmunisation.administrationTime",
      "path" : "EHDSImmunisation.administrationTime",
      "short" : "The date and optionally the exact time when the vaccination was administered.",
      "definition" : "The date and optionally the exact time when the vaccination was administered.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSImmunisation.administeringCentre",
      "path" : "EHDSImmunisation.administeringCentre",
      "short" : "Administering centre or a health authority responsible for the vaccination event.",
      "definition" : "Administering centre or a health authority responsible for the vaccination event.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSImmunisation.administrator",
      "path" : "EHDSImmunisation.administrator",
      "short" : "Health professional responsible for administering the immunisation product.",
      "definition" : "Health professional responsible for administering the immunisation product.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      }]
    },
    {
      "id" : "EHDSImmunisation.note",
      "path" : "EHDSImmunisation.note",
      "short" : "Free text notes by the health professional.",
      "definition" : "Free text notes by the health professional.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
