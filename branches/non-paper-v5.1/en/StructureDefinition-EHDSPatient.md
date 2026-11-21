# Patient model - EHDS Logical Information Models v0.3.0

## Logical Model: Patient model 

**Usages:**

* Use this Logical Model: [DataSet model](StructureDefinition-EHDSDataSet.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication dispense model.](StructureDefinition-EHDSMedicationDispense.md)... Show 4 more, [Observation model](StructureDefinition-EHDSObservation.md), [Related person model](StructureDefinition-EHDSRelatedPerson.md), [Data group search metadata model](StructureDefinition-EHDSSearchMetadata.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSPatient.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSPatient.csv), [Excel](../StructureDefinition-EHDSPatient.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSPatient",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient",
  "version" : "0.3.0",
  "name" : "EHDSPatient",
  "title" : "Patient model",
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
  "description" : "EHDSPatient means a structured set of data elements describing a subject of care.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSPatient",
      "path" : "EHDSPatient",
      "short" : "Patient model",
      "definition" : "EHDSPatient means a structured set of data elements describing a subject of care."
    },
    {
      "id" : "EHDSPatient.identifier",
      "path" : "EHDSPatient.identifier",
      "short" : "A stable identifier of the patient that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included.",
      "definition" : "A stable identifier of the patient that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSPatient.identifier.type",
      "path" : "EHDSPatient.identifier.type",
      "short" : "Description of identifier consisting of HL7 identifier type extended with: NI (national unique identifier); HI (health identifier); HIN (health insurance number); SS (social security identifier); REGPID (regional person identifier); REGION (region identifier).",
      "definition" : "Description of identifier consisting of HL7 identifier type extended with: NI (national unique identifier); HI (health identifier); HIN (health insurance number); SS (social security identifier); REGPID (regional person identifier); REGION (region identifier).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Identifier Type with an appropriate extension"
      }
    },
    {
      "id" : "EHDSPatient.identifier.value",
      "path" : "EHDSPatient.identifier.value",
      "short" : "The value that is unique.",
      "definition" : "The value that is unique.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSPatient.identifier.system",
      "path" : "EHDSPatient.identifier.system",
      "short" : "The namespace for the Identifier value.",
      "definition" : "The namespace for the Identifier value.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSPatient.name",
      "path" : "EHDSPatient.name",
      "short" : "Name associated with the patient.",
      "definition" : "Name associated with the patient.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHumanName"
      }]
    },
    {
      "id" : "EHDSPatient.dateOfBirth",
      "path" : "EHDSPatient.dateOfBirth",
      "short" : "Date of birth.",
      "definition" : "Date of birth.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSPatient.deceased[x]",
      "path" : "EHDSPatient.deceased[x]",
      "short" : "Indicator stating whether the patient is deceased or date and optionally time of death.",
      "definition" : "Indicator stating whether the patient is deceased or date and optionally time of death.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      },
      {
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSPatient.administrativeGender",
      "path" : "EHDSPatient.administrativeGender",
      "short" : "The gender that the patient is considered to have for administration and record-keeping purposes.",
      "definition" : "The gender that the patient is considered to have for administration and record-keeping purposes.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Administrative Gender"
      }
    },
    {
      "id" : "EHDSPatient.genderIdentity",
      "path" : "EHDSPatient.genderIdentity",
      "short" : "The gender identity as declared by the patient.",
      "definition" : "The gender identity as declared by the patient.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSPatient.sexForClinicalUse",
      "path" : "EHDSPatient.sexForClinicalUse",
      "short" : "A summary parameter that provides guidance on how a receiver shall apply settings or reference ranges that are derived from observable information such as an organ inventory, recent hormone lab tests, genetic testing, menstrual status, obstetric history, etc.",
      "definition" : "A summary parameter that provides guidance on how a receiver shall apply settings or reference ranges that are derived from observable information such as an organ inventory, recent hormone lab tests, genetic testing, menstrual status, obstetric history, etc.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Sex Parameter For Clinical Use"
      }
    },
    {
      "id" : "EHDSPatient.address",
      "path" : "EHDSPatient.address",
      "short" : "Address of the patient.",
      "definition" : "Address of the patient.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress"
      }]
    },
    {
      "id" : "EHDSPatient.telecom",
      "path" : "EHDSPatient.telecom",
      "short" : "Contact information.",
      "definition" : "Contact information.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTelecom"
      }]
    }]
  }
}

```
