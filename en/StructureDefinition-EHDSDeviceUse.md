# Device use model - EHDS Logical Information Models v0.3.0

## Logical Model: Device use model 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSDeviceUse.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSDeviceUse.csv), [Excel](../StructureDefinition-EHDSDeviceUse.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSDeviceUse",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDeviceUse",
  "version" : "0.3.0",
  "name" : "EHDSDeviceUse",
  "title" : "Device use model",
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
  "description" : "EHDSDeviceUse means a structured set of data elements describing the use of a medical device.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDeviceUse",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSDeviceUse",
      "path" : "EHDSDeviceUse",
      "short" : "Device use model",
      "definition" : "EHDSDeviceUse means a structured set of data elements describing the use of a medical device."
    },
    {
      "id" : "EHDSDeviceUse.header.identifier",
      "path" : "EHDSDeviceUse.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSDeviceUse.header.version",
      "path" : "EHDSDeviceUse.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSDeviceUse.header.author[x]",
      "path" : "EHDSDeviceUse.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSDeviceUse.header.status",
      "path" : "EHDSDeviceUse.header.status",
      "short" : "Current status of the device usage, e.g. active, completed.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Device Use Statement Status"
      }
    },
    {
      "id" : "EHDSDeviceUse.periodOfUse",
      "path" : "EHDSDeviceUse.periodOfUse",
      "short" : "The period of time during which the device was implanted in the patient or the external device was in use.",
      "definition" : "The period of time during which the device was implanted in the patient or the external device was in use.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSDeviceUse.device[x]",
      "path" : "EHDSDeviceUse.device[x]",
      "short" : "The details of the device used.",
      "definition" : "The details of the device used.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), EMDN"
      }
    },
    {
      "id" : "EHDSDeviceUse.bodySite",
      "path" : "EHDSDeviceUse.bodySite",
      "short" : "Anatomical location of the device. May include laterality.",
      "definition" : "Anatomical location of the device. May include laterality.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSDeviceUse.reason[x]",
      "path" : "EHDSDeviceUse.reason[x]",
      "short" : "Reason or justification for the use of the device.",
      "definition" : "Reason or justification for the use of the device.",
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
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSProcedure"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10, Orphacode"
      }
    },
    {
      "id" : "EHDSDeviceUse.note",
      "path" : "EHDSDeviceUse.note",
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
