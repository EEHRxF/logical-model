# Related person model - EHDS Logical Information Models v0.3.0

## Logical Model: Related person model 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication dispense model.](StructureDefinition-EHDSMedicationDispense.md)... Show 2 more, [Observation model](StructureDefinition-EHDSObservation.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSRelatedPerson.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSRelatedPerson.csv), [Excel](../StructureDefinition-EHDSRelatedPerson.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSRelatedPerson",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSRelatedPerson",
  "version" : "0.3.0",
  "name" : "EHDSRelatedPerson",
  "title" : "Related person model",
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
  "description" : "EHDSRelatedPerson means a structured set of data elements describing a person related to the patient, such as a guardian, next of kin, or other related person.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSRelatedPerson",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSRelatedPerson",
      "path" : "EHDSRelatedPerson",
      "short" : "Related person model",
      "definition" : "EHDSRelatedPerson means a structured set of data elements describing a person related to the patient, such as a guardian, next of kin, or other related person."
    },
    {
      "id" : "EHDSRelatedPerson.identifier",
      "path" : "EHDSRelatedPerson.identifier",
      "short" : "A stable identifier of the related person that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included.",
      "definition" : "A stable identifier of the related person that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.identifier.type",
      "path" : "EHDSRelatedPerson.identifier.type",
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
      "id" : "EHDSRelatedPerson.identifier.value",
      "path" : "EHDSRelatedPerson.identifier.value",
      "short" : "The value that is unique.",
      "definition" : "The value that is unique.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.identifier.system",
      "path" : "EHDSRelatedPerson.identifier.system",
      "short" : "The namespace for the Identifier value.",
      "definition" : "The namespace for the Identifier value.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.name",
      "path" : "EHDSRelatedPerson.name",
      "short" : "Name associated with the person.",
      "definition" : "Name associated with the person.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHumanName"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.subject",
      "path" : "EHDSRelatedPerson.subject",
      "short" : "The patient in relation to whom the related person is defined.",
      "definition" : "The patient in relation to whom the related person is defined.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.relationship",
      "path" : "EHDSRelatedPerson.relationship",
      "short" : "Relationship between a patient and a contact person for that patient (e.g. relative, guardian or caring person).",
      "definition" : "Relationship between a patient and a contact person for that patient (e.g. relative, guardian or caring person).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Patient Relationship Type"
      }
    },
    {
      "id" : "EHDSRelatedPerson.address",
      "path" : "EHDSRelatedPerson.address",
      "short" : "Address of the person.",
      "definition" : "Address of the person.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress"
      }]
    },
    {
      "id" : "EHDSRelatedPerson.telecom",
      "path" : "EHDSRelatedPerson.telecom",
      "short" : "Telecommunication contact information of the person.",
      "definition" : "Telecommunication contact information of the person.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTelecom"
      }]
    }]
  }
}

```
