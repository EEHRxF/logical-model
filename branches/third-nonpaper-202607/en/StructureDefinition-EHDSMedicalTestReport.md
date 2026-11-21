# Medical test result and report model - EHDS Logical Information Models v0.3.0

## Logical Model: Medical test result and report model 

 
Medical test results, including laboratory and other diagnostic results and related reports. 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedicalTestReport.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedicalTestReport.csv), [Excel](../StructureDefinition-EHDSMedicalTestReport.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedicalTestReport",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicalTestReport",
  "version" : "0.3.0",
  "name" : "EHDSMedicalTestReport",
  "title" : "Medical test result and report model",
  "status" : "draft",
  "date" : "2026-09-10T07:52:32+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "Medical test results, including laboratory and other diagnostic results and related reports.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicalTestReport",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocument",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedicalTestReport",
      "path" : "EHDSMedicalTestReport",
      "short" : "Medical test result and report model",
      "definition" : "Medical test results, including laboratory and other diagnostic results and related reports."
    },
    {
      "id" : "EHDSMedicalTestReport.header.date",
      "path" : "EHDSMedicalTestReport.header.date",
      "short" : "Date and optionally time of authoring/issuing."
    },
    {
      "id" : "EHDSMedicalTestReport.header.documentType",
      "path" : "EHDSMedicalTestReport.header.documentType",
      "short" : "Type of document (e.g., 11502-2 'Laboratory report' or 18759-1 'Spirometry study')."
    },
    {
      "id" : "EHDSMedicalTestReport.header.documentTitle",
      "path" : "EHDSMedicalTestReport.header.documentTitle",
      "short" : "Human readable document title that can be displayed in search results, etc. This can be documentType's display name, or it can be assembled from multiple elements. Examples: Medical test report'."
    },
    {
      "id" : "EHDSMedicalTestReport.header.legalAuthentication.legalAuthenticator[x]",
      "path" : "EHDSMedicalTestReport.header.legalAuthentication.legalAuthenticator[x]",
      "short" : "The person or organization taking responsibility for the content of the document."
    },
    {
      "id" : "EHDSMedicalTestReport.header.legalAuthentication.dateTime",
      "path" : "EHDSMedicalTestReport.header.legalAuthentication.dateTime",
      "short" : "Date and time when the document was authorised."
    },
    {
      "id" : "EHDSMedicalTestReport.header.eventCategory",
      "path" : "EHDSMedicalTestReport.header.eventCategory",
      "short" : "Categorisation of the event covered by the document (e.g. medical study types etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes.",
      "binding" : {
        "strength" : "required",
        "description" : "LOINC (preferred), SNOMED GPS"
      }
    },
    {
      "id" : "EHDSMedicalTestReport.intendedRecipient[x]",
      "path" : "EHDSMedicalTestReport.intendedRecipient[x]",
      "short" : "Information recipient of the information, i.e. a person or organisation that should be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals).",
      "definition" : "Information recipient of the information, i.e. a person or organisation that should be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSRelatedPerson"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body",
      "path" : "EHDSMedicalTestReport.body",
      "short" : "Medical test result and report structured body.",
      "definition" : "Medical test result and report structured body.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation",
      "path" : "EHDSMedicalTestReport.body.orderInformation",
      "short" : "Order information",
      "definition" : "Order information",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation.orderId",
      "path" : "EHDSMedicalTestReport.body.orderInformation.orderId",
      "short" : "An identifier of the medical test order.",
      "definition" : "An identifier of the medical test order.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation.orderDateAndTime",
      "path" : "EHDSMedicalTestReport.body.orderInformation.orderDateAndTime",
      "short" : "Date and time of the order placement.",
      "definition" : "Date and time of the order placement.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation.orderPlacer[x]",
      "path" : "EHDSMedicalTestReport.body.orderInformation.orderPlacer[x]",
      "short" : "The person/organisation authorised to place the order.",
      "definition" : "The person/organisation authorised to place the order.",
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
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation.orderReason[x]",
      "path" : "EHDSMedicalTestReport.body.orderInformation.orderReason[x]",
      "short" : "An explanation or justification for why this service is being requested.",
      "definition" : "An explanation or justification for why this service is being requested.",
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
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10"
      }
    },
    {
      "id" : "EHDSMedicalTestReport.body.orderInformation.clinicalQuestion",
      "path" : "EHDSMedicalTestReport.body.orderInformation.clinicalQuestion",
      "short" : "Specification of clinical question (goal of the investigation) to be answered by the medical test.",
      "definition" : "Specification of clinical question (goal of the investigation) to be answered by the medical test.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.supportingInformation",
      "path" : "EHDSMedicalTestReport.body.supportingInformation",
      "short" : "Additional clinical information about the patient or specimen that may influence the services or their interpretations. This information includes diagnosis, clinical findings and other observations. In medical test ordering these are typically referred to as 'ask at order entry questions (AOEs).' This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the amount of inspired oxygen for blood gas measurements.",
      "definition" : "Additional clinical information about the patient or specimen that may influence the services or their interpretations. This information includes diagnosis, clinical findings and other observations. In medical test ordering these are typically referred to as 'ask at order entry questions (AOEs).' This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the amount of inspired oxygen for blood gas measurements.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.supportingInformation.observation",
      "path" : "EHDSMedicalTestReport.body.supportingInformation.observation",
      "short" : "Clinical findings and other observations.",
      "definition" : "Clinical findings and other observations.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.supportingInformation.condition",
      "path" : "EHDSMedicalTestReport.body.supportingInformation.condition",
      "short" : "Condition that may influence the service or result interpretation.",
      "definition" : "Condition that may influence the service or result interpretation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.supportingInformation.medicationAdministration",
      "path" : "EHDSMedicalTestReport.body.supportingInformation.medicationAdministration",
      "short" : "Medication administered before ordering the service that may influence the service or result interpretation.",
      "definition" : "Medication administered before ordering the service that may influence the service or result interpretation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationAdministration"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.supportingInformation.immunisation",
      "path" : "EHDSMedicalTestReport.body.supportingInformation.immunisation",
      "short" : "Immunisation history that may influence the service or result interpretation.",
      "definition" : "Immunisation history that may influence the service or result interpretation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.specimen",
      "path" : "EHDSMedicalTestReport.body.specimen",
      "short" : "Specimen information.",
      "definition" : "Specimen information.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.resultData",
      "path" : "EHDSMedicalTestReport.body.resultData",
      "short" : "Medical test result data.",
      "definition" : "Medical test result data.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.resultData.comment",
      "path" : "EHDSMedicalTestReport.body.resultData.comment",
      "short" : "Narrative, potentially formatted, such as a textual interpretation or advice accompanying the result report.",
      "definition" : "Narrative, potentially formatted, such as a textual interpretation or advice accompanying the result report.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.body.resultData.medicalTestResult[x]",
      "path" : "EHDSMedicalTestReport.body.resultData.medicalTestResult[x]",
      "short" : "Observation details.",
      "definition" : "Observation details.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLaboratoryObservation"
      }]
    },
    {
      "id" : "EHDSMedicalTestReport.attachments",
      "path" : "EHDSMedicalTestReport.attachments",
      "short" : "Report attachments.",
      "definition" : "Report attachments.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment"
      }]
    }]
  }
}

```
