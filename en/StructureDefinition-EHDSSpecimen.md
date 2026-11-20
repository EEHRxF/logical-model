# Specimen model - EHDS Logical Information Models v0.3.0

## Logical Model: Specimen model 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Imaging study model.](StructureDefinition-EHDSImagingStudy.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Observation model](StructureDefinition-EHDSObservation.md)... Show 2 more, [Service request model](StructureDefinition-EHDSServiceRequest.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSSpecimen.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSSpecimen.csv), [Excel](../StructureDefinition-EHDSSpecimen.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSSpecimen",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen",
  "version" : "0.3.0",
  "name" : "EHDSSpecimen",
  "title" : "Specimen model",
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
  "description" : "EHDSSpecimen means a structured set of data elements describing a sample collected.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSSpecimen",
      "path" : "EHDSSpecimen",
      "short" : "Specimen model",
      "definition" : "EHDSSpecimen means a structured set of data elements describing a sample collected."
    },
    {
      "id" : "EHDSSpecimen.identifier",
      "path" : "EHDSSpecimen.identifier",
      "short" : "An identifier of the specimen which is unique within a defined scope.",
      "definition" : "An identifier of the specimen which is unique within a defined scope.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSSpecimen.status",
      "path" : "EHDSSpecimen.status",
      "short" : "Availability of the specimen.",
      "definition" : "Availability of the specimen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Specimen Status"
      }
    },
    {
      "id" : "EHDSSpecimen.type",
      "path" : "EHDSSpecimen.type",
      "short" : "The kind of material that forms the specimen.",
      "definition" : "The kind of material that forms the specimen.",
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
      "id" : "EHDSSpecimen.specimenSource[x]",
      "path" : "EHDSSpecimen.specimenSource[x]",
      "short" : "The source where the specimen came from. This may be from a patient, from a location (e.g. the source of an environmental sample) or from a device.",
      "definition" : "The source where the specimen came from. This may be from a patient, from a location (e.g. the source of an environmental sample) or from a device.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLocation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSSpecimen.parentSpecimen",
      "path" : "EHDSSpecimen.parentSpecimen",
      "short" : "Specimen from which this specimen originated.",
      "definition" : "Specimen from which this specimen originated.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen"
      }]
    },
    {
      "id" : "EHDSSpecimen.request",
      "path" : "EHDSSpecimen.request",
      "short" : "Service request on the basis of which the specimen was collected.",
      "definition" : "Service request on the basis of which the specimen was collected.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSServiceRequest"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection",
      "path" : "EHDSSpecimen.collection",
      "short" : "Collection details.",
      "definition" : "Collection details.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection.performer[x]",
      "path" : "EHDSSpecimen.collection.performer[x]",
      "short" : "Person or organisation who collected the specimen.",
      "definition" : "Person or organisation who collected the specimen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSRelatedPerson"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection.collected[x]",
      "path" : "EHDSSpecimen.collection.collected[x]",
      "short" : "The period or date and time of specimen collection.",
      "definition" : "The period or date and time of specimen collection.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      },
      {
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection.quantity",
      "path" : "EHDSSpecimen.collection.quantity",
      "short" : "The quantity of specimen collected.",
      "definition" : "The quantity of specimen collected.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection.method",
      "path" : "EHDSSpecimen.collection.method",
      "short" : "If relevant for the results, the method of obtaining the specimen.",
      "definition" : "If relevant for the results, the method of obtaining the specimen.",
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
      "id" : "EHDSSpecimen.collection.device",
      "path" : "EHDSSpecimen.collection.device",
      "short" : "Device used to perform specimen collection.",
      "definition" : "Device used to perform specimen collection.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSSpecimen.collection.bodySite",
      "path" : "EHDSSpecimen.collection.bodySite",
      "short" : "Anatomic location where the material is collected.",
      "definition" : "Anatomic location where the material is collected.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSSpecimen.receivedDate",
      "path" : "EHDSSpecimen.receivedDate",
      "short" : "Date and time when specimen is received by the testing laboratory.",
      "definition" : "Date and time when specimen is received by the testing laboratory.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSSpecimen.container",
      "path" : "EHDSSpecimen.container",
      "short" : "The container holding the specimen.",
      "definition" : "The container holding the specimen.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSSpecimen.container.specimenQuantity",
      "path" : "EHDSSpecimen.container.specimenQuantity",
      "short" : "Quantity of specimen within the container.",
      "definition" : "Quantity of specimen within the container.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "EHDSSpecimen.container.containerDevice",
      "path" : "EHDSSpecimen.container.containerDevice",
      "short" : "The device for the container holding the specimen.",
      "definition" : "The device for the container holding the specimen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSSpecimen.condition",
      "path" : "EHDSSpecimen.condition",
      "short" : "State of the specimen. State of the specimen shall be aligned with the dataAbsentReason element of the Observation model.",
      "definition" : "State of the specimen. State of the specimen shall be aligned with the dataAbsentReason element of the Observation model.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Specimen Condition"
      }
    },
    {
      "id" : "EHDSSpecimen.note",
      "path" : "EHDSSpecimen.note",
      "short" : "Any details or issues about the specimen or during the specimen collection (for example: broken vial, sent with patient, frozen).",
      "definition" : "Any details or issues about the specimen or during the specimen collection (for example: broken vial, sent with patient, frozen).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
