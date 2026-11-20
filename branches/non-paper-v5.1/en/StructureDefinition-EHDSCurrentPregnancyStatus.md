# Current pregnancy status model - EHDS Logical Information Models v0.3.0

## Logical Model: Current pregnancy status model 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSCurrentPregnancyStatus.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSCurrentPregnancyStatus.csv), [Excel](../StructureDefinition-EHDSCurrentPregnancyStatus.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSCurrentPregnancyStatus",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCurrentPregnancyStatus",
  "version" : "0.3.0",
  "name" : "EHDSCurrentPregnancyStatus",
  "title" : "Current pregnancy status model",
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
  "description" : "EHDSCurrentPregnancyStatus means a structured set of data elements describing a patient's pregnancy status at a given point in time.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCurrentPregnancyStatus",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSCurrentPregnancyStatus",
      "path" : "EHDSCurrentPregnancyStatus",
      "short" : "Current pregnancy status model",
      "definition" : "EHDSCurrentPregnancyStatus means a structured set of data elements describing a patient's pregnancy status at a given point in time."
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.header.identifier",
      "path" : "EHDSCurrentPregnancyStatus.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.header.version",
      "path" : "EHDSCurrentPregnancyStatus.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.header.author[x]",
      "path" : "EHDSCurrentPregnancyStatus.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.header.status",
      "path" : "EHDSCurrentPregnancyStatus.header.status",
      "short" : "Status of the condition.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Observation Status"
      }
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.currentPregnancyStatus",
      "path" : "EHDSCurrentPregnancyStatus.currentPregnancyStatus",
      "short" : "Pregnancy status of the patient, e.g. pregnant, not pregnant, possible pregnancy.",
      "definition" : "Pregnancy status of the patient, e.g. pregnant, not pregnant, possible pregnancy.",
      "min" : 1,
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
      "id" : "EHDSCurrentPregnancyStatus.expectedDateOfDelivery",
      "path" : "EHDSCurrentPregnancyStatus.expectedDateOfDelivery",
      "short" : "Date on which the woman is due to give birth. Day, year and month are required.",
      "definition" : "Date on which the woman is due to give birth. Day, year and month are required.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.gestationalAge",
      "path" : "EHDSCurrentPregnancyStatus.gestationalAge",
      "short" : "Duration of the pregnancy (weeks, days or weeks and days) at the time of the observation.",
      "definition" : "Duration of the pregnancy (weeks, days or weeks and days) at the time of the observation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSCurrentPregnancyStatus.note",
      "path" : "EHDSCurrentPregnancyStatus.note",
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
