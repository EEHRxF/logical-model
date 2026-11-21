# Imaging report model. - EHDS Logical Information Models v0.3.0

## Logical Model: Imaging report model. 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSImagingReport.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSImagingReport.csv), [Excel](../StructureDefinition-EHDSImagingReport.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSImagingReport",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingReport",
  "version" : "0.3.0",
  "name" : "EHDSImagingReport",
  "title" : "Imaging report model.",
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
  "description" : "Imaging report.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingReport",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocument",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSImagingReport",
      "path" : "EHDSImagingReport",
      "short" : "Imaging report model.",
      "definition" : "Imaging report."
    },
    {
      "id" : "EHDSImagingReport.header.identifier",
      "path" : "EHDSImagingReport.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
    },
    {
      "id" : "EHDSImagingReport.header.author[x]",
      "path" : "EHDSImagingReport.header.author[x]",
      "short" : "Author of the document."
    },
    {
      "id" : "EHDSImagingReport.header.date",
      "path" : "EHDSImagingReport.header.date",
      "short" : "Date and optionally time of authoring/issuing"
    },
    {
      "id" : "EHDSImagingReport.header.documentCategory",
      "path" : "EHDSImagingReport.header.documentCategory",
      "short" : "Broad category of document (e.g. 18748-4 Diagnostic imaging study)."
    },
    {
      "id" : "EHDSImagingReport.header.documentType",
      "path" : "EHDSImagingReport.header.documentType",
      "short" : "Type of document (e.g. 24627-2 Chest CT)."
    },
    {
      "id" : "EHDSImagingReport.header.documentTitle",
      "path" : "EHDSImagingReport.header.documentTitle",
      "short" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may contain further information."
    },
    {
      "id" : "EHDSImagingReport.header.period",
      "path" : "EHDSImagingReport.header.period",
      "short" : "Time of service (imaging study) that is being documented."
    },
    {
      "id" : "EHDSImagingReport.header.legalAuthentication",
      "path" : "EHDSImagingReport.header.legalAuthentication",
      "short" : "Document legal authentication details."
    },
    {
      "id" : "EHDSImagingReport.header.legalAuthentication.legalAuthenticator[x]",
      "path" : "EHDSImagingReport.header.legalAuthentication.legalAuthenticator[x]",
      "short" : "The person or organisation taking responsibility for the content of the document."
    },
    {
      "id" : "EHDSImagingReport.header.eventCategory",
      "path" : "EHDSImagingReport.header.eventCategory",
      "short" : "Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes.",
      "binding" : {
        "strength" : "required",
        "description" : "DICOM CID 33 Modality (preferred), SNOMED GPS"
      }
    },
    {
      "id" : "EHDSImagingReport.header.accessionNumber",
      "path" : "EHDSImagingReport.header.accessionNumber",
      "short" : "Accession number – an identifier, managed by the radiology information system at the local level, which usually uniquely identifies an imaging procedure request, and links it to the imaging study and related imaging report.",
      "definition" : "Accession number – an identifier, managed by the radiology information system at the local level, which usually uniquely identifies an imaging procedure request, and links it to the imaging study and related imaging report.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSImagingReport.header.intendedRecipient[x]",
      "path" : "EHDSImagingReport.header.intendedRecipient[x]",
      "short" : "Intended recipient of the information, i.e. a person or organisation that shall be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals).",
      "definition" : "Intended recipient of the information, i.e. a person or organisation that shall be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals).",
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
      }]
    },
    {
      "id" : "EHDSImagingReport.presentedForm",
      "path" : "EHDSImagingReport.presentedForm",
      "short" : "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document. At least one of body or presentedForm shall be present."
    },
    {
      "id" : "EHDSImagingReport.body",
      "path" : "EHDSImagingReport.body",
      "short" : "Imaging report structured body. At least one of body or presentedForm shall be present.",
      "definition" : "Imaging report structured body. At least one of body or presentedForm shall be present.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.orderInformation",
      "path" : "EHDSImagingReport.body.orderInformation",
      "short" : "Order to which this imaging report is linked.",
      "definition" : "Order to which this imaging report is linked.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.orderInformation.orderId",
      "path" : "EHDSImagingReport.body.orderInformation.orderId",
      "short" : "Identifier of the imaging service order.",
      "definition" : "Identifier of the imaging service order.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.orderInformation.orderDateAndTime",
      "path" : "EHDSImagingReport.body.orderInformation.orderDateAndTime",
      "short" : "Date and time of the order placement.",
      "definition" : "Date and time of the order placement.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.orderInformation.orderPlacer[x]",
      "path" : "EHDSImagingReport.body.orderInformation.orderPlacer[x]",
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
      "id" : "EHDSImagingReport.body.orderInformation.orderReason[x]",
      "path" : "EHDSImagingReport.body.orderInformation.orderReason[x]",
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
      "id" : "EHDSImagingReport.body.orderInformation.clinicalQuestion",
      "path" : "EHDSImagingReport.body.orderInformation.clinicalQuestion",
      "short" : "Specification of clinical question (goal of the investigation) to be answered by the imaging investigation.",
      "definition" : "Specification of clinical question (goal of the investigation) to be answered by the imaging investigation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation",
      "path" : "EHDSImagingReport.body.supportingInformation",
      "short" : "This information includes diagnosis, clinical findings and other observations. This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the metal implants present in patient’s body.",
      "definition" : "This information includes diagnosis, clinical findings and other observations. This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the metal implants present in patient’s body.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation.observation",
      "path" : "EHDSImagingReport.body.supportingInformation.observation",
      "short" : "Clinical findings and other observations (e.g. height and weight of the patient).",
      "definition" : "Clinical findings and other observations (e.g. height and weight of the patient).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation.condition",
      "path" : "EHDSImagingReport.body.supportingInformation.condition",
      "short" : "Condition that may influence the service or result interpretation.",
      "definition" : "Condition that may influence the service or result interpretation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation.priorMedicationAdministration",
      "path" : "EHDSImagingReport.body.supportingInformation.priorMedicationAdministration",
      "short" : "Medication administered before ordering the service that may influence the service or result interpretation.",
      "definition" : "Medication administered before ordering the service that may influence the service or result interpretation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationUse"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation.device",
      "path" : "EHDSImagingReport.body.supportingInformation.device",
      "short" : "List of implants or devices that affect the course of the examination or its interpretation (e.g. metal implants).",
      "definition" : "List of implants or devices that affect the course of the examination or its interpretation (e.g. metal implants).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDeviceUse"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.supportingInformation.pregnancyStatus",
      "path" : "EHDSImagingReport.body.supportingInformation.pregnancyStatus",
      "short" : "Pregnancy status when the imaging examination was performed, e.g. pregnant, not pregnant, unknown.",
      "definition" : "Pregnancy status when the imaging examination was performed, e.g. pregnant, not pregnant, unknown.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCurrentPregnancyStatus"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.specimen",
      "path" : "EHDSImagingReport.body.specimen",
      "short" : "Specimen information.",
      "definition" : "Specimen information.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation",
      "path" : "EHDSImagingReport.body.exposureInformation",
      "short" : "Information on total exposure to ionised radiation during the imaging investigation.",
      "definition" : "Information on total exposure to ionised radiation during the imaging investigation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.summary",
      "path" : "EHDSImagingReport.body.exposureInformation.summary",
      "short" : "Summary information about the exposure to ionised radiation.",
      "definition" : "Summary information about the exposure to ionised radiation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.structuredDose",
      "path" : "EHDSImagingReport.body.exposureInformation.structuredDose",
      "short" : "Structured representation of the exposure.",
      "definition" : "Structured representation of the exposure.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.structuredDose.doseQuantity",
      "path" : "EHDSImagingReport.body.exposureInformation.structuredDose.doseQuantity",
      "short" : "Ionised radiation received during the imaging investigation.",
      "definition" : "Ionised radiation received during the imaging investigation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units"
      }
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.structuredDose.doseModality",
      "path" : "EHDSImagingReport.body.exposureInformation.structuredDose.doseModality",
      "short" : "Imaging modality used during imaging investigation (DICOM CID029).",
      "definition" : "Imaging modality used during imaging investigation (DICOM CID029).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "DICOM Modality"
      }
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.structuredDose.bodySite",
      "path" : "EHDSImagingReport.body.exposureInformation.structuredDose.bodySite",
      "short" : "Body part investigated.",
      "definition" : "Body part investigated.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.exposureInformation.structuredDose.numberOfSeries",
      "path" : "EHDSImagingReport.body.exposureInformation.structuredDose.numberOfSeries",
      "short" : "Number of series in the study.",
      "definition" : "Number of series in the study.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport",
      "path" : "EHDSImagingReport.body.examinationReport",
      "short" : "Examination report content.",
      "definition" : "Examination report content.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.modality",
      "path" : "EHDSImagingReport.body.examinationReport.modality",
      "short" : "Imaging modality used during imaging investigation (DICOM CID029).",
      "definition" : "Imaging modality used during imaging investigation (DICOM CID029).",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "DICOM Modality"
      }
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.bodySite",
      "path" : "EHDSImagingReport.body.examinationReport.bodySite",
      "short" : "Body part investigated.",
      "definition" : "Body part investigated.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.imagingProcedure",
      "path" : "EHDSImagingReport.body.examinationReport.imagingProcedure",
      "short" : "Imaging procedure performed during imaging study.",
      "definition" : "Imaging procedure performed during imaging study.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSProcedure"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.medicationAdministration",
      "path" : "EHDSImagingReport.body.examinationReport.medicationAdministration",
      "short" : "Information about medications administered (contrast, sedation, stress agents, etc.) to enable the imaging investigation or during it.",
      "definition" : "Information about medications administered (contrast, sedation, stress agents, etc.) to enable the imaging investigation or during it.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationAdministration"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.adverseReaction",
      "path" : "EHDSImagingReport.body.examinationReport.adverseReaction",
      "short" : "Adverse reaction manifested during imaging investigation.",
      "definition" : "Adverse reaction manifested during imaging investigation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAllergyIntolerance"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.result[x]",
      "path" : "EHDSImagingReport.body.examinationReport.result[x]",
      "short" : "Imaging report result data.",
      "definition" : "Imaging report result data.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.conclusion",
      "path" : "EHDSImagingReport.body.examinationReport.conclusion",
      "short" : "A concise and clinically contextualised summary including interpretation/impression of the diagnostic report.",
      "definition" : "A concise and clinically contextualised summary including interpretation/impression of the diagnostic report.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.conclusion.impression",
      "path" : "EHDSImagingReport.body.examinationReport.conclusion.impression",
      "short" : "Narrative description of the clinical conclusion (impression).",
      "definition" : "Narrative description of the clinical conclusion (impression).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x]",
      "path" : "EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x]",
      "short" : "Condition or finding from imaging investigation.",
      "definition" : "Condition or finding from imaging investigation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.recommendation",
      "path" : "EHDSImagingReport.body.recommendation",
      "short" : "Recommendation section for additional imaging investigations or other actions.",
      "definition" : "Recommendation section for additional imaging investigations or other actions.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.recommendation.description",
      "path" : "EHDSImagingReport.body.recommendation.description",
      "short" : "Narrative description of the recommended activities including additional investigation, medication, etc.",
      "definition" : "Narrative description of the recommended activities including additional investigation, medication, etc.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.recommendation.carePlan",
      "path" : "EHDSImagingReport.body.recommendation.carePlan",
      "short" : "Complex and structured information about recommended goals, activities and objectives in the form of one or more formal care plans to be implemented after this imaging investigation.",
      "definition" : "Complex and structured information about recommended goals, activities and objectives in the form of one or more formal care plans to be implemented after this imaging investigation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCarePlan"
      }]
    },
    {
      "id" : "EHDSImagingReport.body.comparisonStudy",
      "path" : "EHDSImagingReport.body.comparisonStudy",
      "short" : "Documentation (reference) of a prior imaging report to which the current images were compared.",
      "definition" : "Documentation (reference) of a prior imaging report to which the current images were compared.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingReport"
      }]
    },
    {
      "id" : "EHDSImagingReport.dicomStudyMetadata",
      "path" : "EHDSImagingReport.dicomStudyMetadata",
      "short" : "Metadata of the DICOM study. A study comprises a set of series, each of which includes a set of Service-Object Pair (SOP) instances (SOP instances – images or other data) acquired or produced in a common context. A series is of only one modality (e.g. X-ray, computed tomography, magnetic resonance or ultrasound), but a study may have multiple series of different modalities.",
      "definition" : "Metadata of the DICOM study. A study comprises a set of series, each of which includes a set of Service-Object Pair (SOP) instances (SOP instances – images or other data) acquired or produced in a common context. A series is of only one modality (e.g. X-ray, computed tomography, magnetic resonance or ultrasound), but a study may have multiple series of different modalities.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingStudy"
      }]
    },
    {
      "id" : "EHDSImagingReport.attachments",
      "path" : "EHDSImagingReport.attachments",
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
