# Travel history model - EHDS Logical Information Models v0.3.0

## Logical Model: Travel history model 

**Usages:**

* Use this Logical Model: [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSTravelHistory.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSTravelHistory.csv), [Excel](../StructureDefinition-EHDSTravelHistory.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSTravelHistory",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTravelHistory",
  "version" : "0.3.0",
  "name" : "EHDSTravelHistory",
  "title" : "Travel history model",
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
  "description" : "EHDSTravelHistory means a structured set of data elements describing a patient's past travel to a specific country.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTravelHistory",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSTravelHistory",
      "path" : "EHDSTravelHistory",
      "short" : "Travel history model",
      "definition" : "EHDSTravelHistory means a structured set of data elements describing a patient's past travel to a specific country."
    },
    {
      "id" : "EHDSTravelHistory.header.date",
      "path" : "EHDSTravelHistory.header.date",
      "short" : "Date and optionally time of authoring/issuing"
    },
    {
      "id" : "EHDSTravelHistory.header.status",
      "path" : "EHDSTravelHistory.header.status",
      "short" : "Status of the resource or document",
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSTravelHistory.country",
      "path" : "EHDSTravelHistory.country",
      "short" : "Country visited.",
      "definition" : "Country visited.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "ISO 3166-1 alpha-2"
      }
    },
    {
      "id" : "EHDSTravelHistory.period",
      "path" : "EHDSTravelHistory.period",
      "short" : "The period during which the patient visited the country.",
      "definition" : "The period during which the patient visited the country.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    }]
  }
}

```
