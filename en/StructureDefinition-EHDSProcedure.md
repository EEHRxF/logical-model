# Procedure model - EHDS Logical Information Models v0.3.0

## Logical Model: Procedure model 

**Usages:**

* Use this Logical Model: [Device use model](StructureDefinition-EHDSDeviceUse.md), [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Encounter model](StructureDefinition-EHDSEncounter.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md)... Show 4 more, [Observation model](StructureDefinition-EHDSObservation.md), [Patient summary model](StructureDefinition-EHDSPatientSummary.md), [Procedure model](StructureDefinition-EHDSProcedure.md) and [Service request model](StructureDefinition-EHDSServiceRequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSProcedure.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSProcedure.csv), [Excel](../StructureDefinition-EHDSProcedure.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSProcedure",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSProcedure",
  "version" : "0.3.0",
  "name" : "EHDSProcedure",
  "title" : "Procedure model",
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
  "description" : "EHDSProcedure means a structured set of data elements describing a procedure performed on or for a patient, including surgical, therapeutic, and diagnostic procedures and specimen collection, but excluding procedures in the planning stage.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSProcedure",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSProcedure",
      "path" : "EHDSProcedure",
      "short" : "Procedure model",
      "definition" : "EHDSProcedure means a structured set of data elements describing a procedure performed on or for a patient, including surgical, therapeutic, and diagnostic procedures and specimen collection, but excluding procedures in the planning stage."
    },
    {
      "id" : "EHDSProcedure.header.identifier",
      "path" : "EHDSProcedure.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSProcedure.header.version",
      "path" : "EHDSProcedure.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSProcedure.header.author[x]",
      "path" : "EHDSProcedure.header.author[x]",
      "short" : "Author of the resource."
    },
    {
      "id" : "EHDSProcedure.header.status",
      "path" : "EHDSProcedure.header.status",
      "short" : "Status of the procedure, e.g. completed, on hold, stopped.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Event Status"
      }
    },
    {
      "id" : "EHDSProcedure.code",
      "path" : "EHDSProcedure.code",
      "short" : "Concept code and display name identifying the type of procedure.",
      "definition" : "Concept code and display name identifying the type of procedure.",
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
      "id" : "EHDSProcedure.procedureDate[x]",
      "path" : "EHDSProcedure.procedureDate[x]",
      "short" : "Date and time of the procedure or interval of its performance.",
      "definition" : "Date and time of the procedure or interval of its performance.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSProcedure.performer",
      "path" : "EHDSProcedure.performer",
      "short" : "Actors who performed the procedure (only main responsible actors required).",
      "definition" : "Actors who performed the procedure (only main responsible actors required).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      }]
    },
    {
      "id" : "EHDSProcedure.bodySite",
      "path" : "EHDSProcedure.bodySite",
      "short" : "Target body site of the procedure.",
      "definition" : "Target body site of the procedure.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSProcedure.reason[x]",
      "path" : "EHDSProcedure.reason[x]",
      "short" : "The reason for performing the procedure.This may be expressed as a coded concept or as a reference to a specific condition, observation or procedure that describes the reason.",
      "definition" : "The reason for performing the procedure.This may be expressed as a coded concept or as a reference to a specific condition, observation or procedure that describes the reason.",
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
      "id" : "EHDSProcedure.outcome",
      "path" : "EHDSProcedure.outcome",
      "short" : "The immediate result of the procedure (e.g. successful, unsuccessful). This does not include assessment over a longer period of time.",
      "definition" : "The immediate result of the procedure (e.g. successful, unsuccessful). This does not include assessment over a longer period of time.",
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
      "id" : "EHDSProcedure.complication",
      "path" : "EHDSProcedure.complication",
      "short" : "Complication that occurred during the procedure, or in the immediate post-procedure period.",
      "definition" : "Complication that occurred during the procedure, or in the immediate post-procedure period.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10,"
      }
    },
    {
      "id" : "EHDSProcedure.deviceUsed",
      "path" : "EHDSProcedure.deviceUsed",
      "short" : "Device used to perform the procedure.",
      "definition" : "Device used to perform the procedure.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSProcedure.focalDevice",
      "path" : "EHDSProcedure.focalDevice",
      "short" : "Device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a prosthesis, attaching a wound vac, etc.) as a focal portion of the procedure.",
      "definition" : "Device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a prosthesis, attaching a wound vac, etc.) as a focal portion of the procedure.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSProcedure.note",
      "path" : "EHDSProcedure.note",
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
