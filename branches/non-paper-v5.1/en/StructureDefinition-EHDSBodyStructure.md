# Body structure model - EHDS Logical Information Models v0.3.0

## Logical Model: Body structure model 

**Usages:**

* Use this Logical Model: [Condition model](StructureDefinition-EHDSCondition.md), [Device use model](StructureDefinition-EHDSDeviceUse.md), [Dosage model](StructureDefinition-EHDSDosage.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md)... Show 5 more, [Imaging study model.](StructureDefinition-EHDSImagingStudy.md), [Observation model](StructureDefinition-EHDSObservation.md), [Procedure model](StructureDefinition-EHDSProcedure.md), [Service request model](StructureDefinition-EHDSServiceRequest.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSBodyStructure.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSBodyStructure.csv), [Excel](../StructureDefinition-EHDSBodyStructure.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSBodyStructure",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure",
  "version" : "0.3.0",
  "name" : "EHDSBodyStructure",
  "title" : "Body structure model",
  "status" : "draft",
  "date" : "2026-11-21T16:13:39+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSBodyStructure means a structured set of data elements describing an anatomical structure of a patient.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSBodyStructure",
      "path" : "EHDSBodyStructure",
      "short" : "Body structure model",
      "definition" : "EHDSBodyStructure means a structured set of data elements describing an anatomical structure of a patient."
    },
    {
      "id" : "EHDSBodyStructure.morphology",
      "path" : "EHDSBodyStructure.morphology",
      "short" : "The kind of structure being represented by the body structure at BodyStructure.location. This may define both normal and abnormal morphologies.",
      "definition" : "The kind of structure being represented by the body structure at BodyStructure.location. This may define both normal and abnormal morphologies.",
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
      "id" : "EHDSBodyStructure.location",
      "path" : "EHDSBodyStructure.location",
      "short" : "Body site.",
      "definition" : "Body site.",
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
      "id" : "EHDSBodyStructure.locationQualifier",
      "path" : "EHDSBodyStructure.locationQualifier",
      "short" : "Additional qualifier of the body structure (e.g. upper, lower, left side).",
      "definition" : "Additional qualifier of the body structure (e.g. upper, lower, left side).",
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
      "id" : "EHDSBodyStructure.laterality",
      "path" : "EHDSBodyStructure.laterality",
      "short" : "Body structure laterality (e.g. left, right).",
      "definition" : "Body structure laterality (e.g. left, right).",
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
      "id" : "EHDSBodyStructure.description",
      "path" : "EHDSBodyStructure.description",
      "short" : "Textual description of the body structure.",
      "definition" : "Textual description of the body structure.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
