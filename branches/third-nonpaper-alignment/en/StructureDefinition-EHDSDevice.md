# Device or implant model - EHDS Logical Information Models v0.3.0

## Logical Model: Device or implant model 

**Usages:**

* Use this Logical Model: [DataSet model](StructureDefinition-EHDSDataSet.md), [Device use model](StructureDefinition-EHDSDeviceUse.md), [Document model](StructureDefinition-EHDSDocument.md), [Model for observation performed by laboratory](StructureDefinition-EHDSLaboratoryObservation.md)... Show 4 more, [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Observation model](StructureDefinition-EHDSObservation.md), [Procedure model](StructureDefinition-EHDSProcedure.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSDevice.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSDevice.csv), [Excel](../StructureDefinition-EHDSDevice.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSDevice",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice",
  "version" : "0.3.0",
  "name" : "EHDSDevice",
  "title" : "Device or implant model",
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
  "description" : "EHDSDevice means a structured set of data elements describing a medical device or implant.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSDevice",
      "path" : "EHDSDevice",
      "short" : "Device or implant model",
      "definition" : "EHDSDevice means a structured set of data elements describing a medical device or implant."
    },
    {
      "id" : "EHDSDevice.instanceIdentifier",
      "path" : "EHDSDevice.instanceIdentifier",
      "short" : "Identifier of the device instance.",
      "definition" : "Identifier of the device instance.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSDevice.udiCarrier",
      "path" : "EHDSDevice.udiCarrier",
      "short" : "Unique Device Identifier (UDI) value.",
      "definition" : "Unique Device Identifier (UDI) value.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSDevice.manufacturer",
      "path" : "EHDSDevice.manufacturer",
      "short" : "Name of device manufacturer. If the manufacturer code is included in an identifier, manufacturer must correspond to that code.",
      "definition" : "Name of device manufacturer. If the manufacturer code is included in an identifier, manufacturer must correspond to that code.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.manufactureDate",
      "path" : "EHDSDevice.manufactureDate",
      "short" : "Date and optionally time when the device was manufactured.",
      "definition" : "Date and optionally time when the device was manufactured.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSDevice.expiryDate",
      "path" : "EHDSDevice.expiryDate",
      "short" : "The date and time beyond which this device is no longer valid or should not be used (if applicable).",
      "definition" : "The date and time beyond which this device is no longer valid or should not be used (if applicable).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSDevice.lotNumber",
      "path" : "EHDSDevice.lotNumber",
      "short" : "Lot number of device. May be omitted if included in an identifier.",
      "definition" : "Lot number of device. May be omitted if included in an identifier.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.serialNumber",
      "path" : "EHDSDevice.serialNumber",
      "short" : "Serial number assigned by the manufacturer. May be omitted if included in an identifier.",
      "definition" : "Serial number assigned by the manufacturer. May be omitted if included in an identifier.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.name",
      "path" : "EHDSDevice.name",
      "short" : "The name and name type of the device.",
      "definition" : "The name and name type of the device.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSDevice.name.value",
      "path" : "EHDSDevice.name.value",
      "short" : "The name of the device as known to e.g. the manufacturer and/or patient.",
      "definition" : "The name of the device as known to e.g. the manufacturer and/or patient.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.name.type",
      "path" : "EHDSDevice.name.type",
      "short" : "The type of name, e.g. UDI Label name, user friendly name.",
      "definition" : "The type of name, e.g. UDI Label name, user friendly name.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Device name type"
      }
    },
    {
      "id" : "EHDSDevice.modelNumber",
      "path" : "EHDSDevice.modelNumber",
      "short" : "The manufacturer's model number for the device.",
      "definition" : "The manufacturer's model number for the device.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.version",
      "path" : "EHDSDevice.version",
      "short" : "The actual design of the device and/or software version running on the device.",
      "definition" : "The actual design of the device and/or software version running on the device.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDevice.type",
      "path" : "EHDSDevice.type",
      "short" : "Device type.",
      "definition" : "Device type.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), EMDN"
      }
    },
    {
      "id" : "EHDSDevice.note",
      "path" : "EHDSDevice.note",
      "short" : "Device note and/or comment.",
      "definition" : "Device note and/or comment.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
