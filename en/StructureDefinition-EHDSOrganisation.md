# Organisation model - EHDS Logical Information Models v0.3.0

## Logical Model: Organisation model 

**Usages:**

* Use this Logical Model: [DataSet model](StructureDefinition-EHDSDataSet.md), [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Document model](StructureDefinition-EHDSDocument.md), [Document search metadata model](StructureDefinition-EHDSDocumentSearchMetadata.md)... Show 13 more, [Encounter model](StructureDefinition-EHDSEncounter.md), [Endpoint model](StructureDefinition-EHDSEndpoint.md), [Health professional model](StructureDefinition-EHDSHealthProfessional.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Imaging study model.](StructureDefinition-EHDSImagingStudy.md), [Immunisation model](StructureDefinition-EHDSImmunisation.md), [Location model](StructureDefinition-EHDSLocation.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md), [Medication dispense model.](StructureDefinition-EHDSMedicationDispense.md), [Observation model](StructureDefinition-EHDSObservation.md), [Organisation model](StructureDefinition-EHDSOrganisation.md), [Data group search metadata model](StructureDefinition-EHDSSearchMetadata.md) and [Specimen model](StructureDefinition-EHDSSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSOrganisation.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSOrganisation.csv), [Excel](../StructureDefinition-EHDSOrganisation.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSOrganisation",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation",
  "version" : "0.3.0",
  "name" : "EHDSOrganisation",
  "title" : "Organisation model",
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
  "description" : "EHDSOrganisation means a structured set of data elements describing an organisation.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSOrganisation",
      "path" : "EHDSOrganisation",
      "short" : "Organisation model",
      "definition" : "EHDSOrganisation means a structured set of data elements describing an organisation."
    },
    {
      "id" : "EHDSOrganisation.identifier",
      "path" : "EHDSOrganisation.identifier",
      "short" : "Organisation identifier.",
      "definition" : "Organisation identifier.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSOrganisation.type",
      "path" : "EHDSOrganisation.type",
      "short" : "Kind of organisation.",
      "definition" : "Kind of organisation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Organisation Type"
      }
    },
    {
      "id" : "EHDSOrganisation.name",
      "path" : "EHDSOrganisation.name",
      "short" : "Organisation name.",
      "definition" : "Organisation name.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSOrganisation.address",
      "path" : "EHDSOrganisation.address",
      "short" : "Mailing or office address.",
      "definition" : "Mailing or office address.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress"
      }]
    },
    {
      "id" : "EHDSOrganisation.telecom",
      "path" : "EHDSOrganisation.telecom",
      "short" : "Telecommunication contact information (address) associated with the organisation, such as phone number, email or messaging service.",
      "definition" : "Telecommunication contact information (address) associated with the organisation, such as phone number, email or messaging service.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTelecom"
      }]
    },
    {
      "id" : "EHDSOrganisation.partOf",
      "path" : "EHDSOrganisation.partOf",
      "short" : "The organisation of which this organisation forms a part.",
      "definition" : "The organisation of which this organisation forms a part.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    }]
  }
}

```
