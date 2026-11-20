# Health professional model - EHDS Logical Information Models v0.3.0

## Logical Model: Health professional model 

**Usages:**

* Use this Logical Model: [Condition model](StructureDefinition-EHDSCondition.md), [DataSet model](StructureDefinition-EHDSDataSet.md), [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Document model](StructureDefinition-EHDSDocument.md)... Show 11 more, [Document search metadata model](StructureDefinition-EHDSDocumentSearchMetadata.md), [Encounter model](StructureDefinition-EHDSEncounter.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Immunisation model](StructureDefinition-EHDSImmunisation.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication dispense model.](StructureDefinition-EHDSMedicationDispense.md), [Electronic prescription model](StructureDefinition-EHDSMedicationPrescription.md), [Observation model](StructureDefinition-EHDSObservation.md), [Procedure model](StructureDefinition-EHDSProcedure.md), [Data group search metadata model](StructureDefinition-EHDSSearchMetadata.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSHealthProfessional.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSHealthProfessional.csv), [Excel](../StructureDefinition-EHDSHealthProfessional.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSHealthProfessional",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional",
  "version" : "0.3.0",
  "name" : "EHDSHealthProfessional",
  "title" : "Health professional model",
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
  "description" : "EHDSHealthProfessional means a structured set of data elements describing a health professional.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSHealthProfessional",
      "path" : "EHDSHealthProfessional",
      "short" : "Health professional model",
      "definition" : "EHDSHealthProfessional means a structured set of data elements describing a health professional."
    },
    {
      "id" : "EHDSHealthProfessional.identifier",
      "path" : "EHDSHealthProfessional.identifier",
      "short" : "An identifier of the health professional that is unique within a defined scope. Example: national health professional ID. Multiple identifiers may be provided.",
      "definition" : "An identifier of the health professional that is unique within a defined scope. Example: national health professional ID. Multiple identifiers may be provided.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.name",
      "path" : "EHDSHealthProfessional.name",
      "short" : "Name of the health professional.",
      "definition" : "Name of the health professional.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHumanName"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.address",
      "path" : "EHDSHealthProfessional.address",
      "short" : "Address of the health professional.",
      "definition" : "Address of the health professional.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.telecom",
      "path" : "EHDSHealthProfessional.telecom",
      "short" : "Telecommunication contact information (address) associated with the health professional, such as phone number, email or messaging service.",
      "definition" : "Telecommunication contact information (address) associated with the health professional, such as phone number, email or messaging service.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTelecom"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.professionalRole",
      "path" : "EHDSHealthProfessional.professionalRole",
      "short" : "Professional role that the health professional is practising in a given organisation.",
      "definition" : "Professional role that the health professional is practising in a given organisation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.professionalRole.role",
      "path" : "EHDSHealthProfessional.professionalRole.role",
      "short" : "Health professional role.",
      "definition" : "Health professional role.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ISCO-08"
      }
    },
    {
      "id" : "EHDSHealthProfessional.professionalRole.organisation",
      "path" : "EHDSHealthProfessional.professionalRole.organisation",
      "short" : "The organisation where this role is available.",
      "definition" : "The organisation where this role is available.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSHealthProfessional.professionalRole.specialty",
      "path" : "EHDSHealthProfessional.professionalRole.specialty",
      "short" : "The speciality of the health professional they are practising in the organisation.",
      "definition" : "The speciality of the health professional they are practising in the organisation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    }]
  }
}

```
