# Patient summary model - EHDS Logical Information Models v0.3.0

## Logical Model: Patient summary model 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSPatientSummary.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSPatientSummary.csv), [Excel](../StructureDefinition-EHDSPatientSummary.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSPatientSummary",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatientSummary",
  "version" : "0.3.0",
  "name" : "EHDSPatientSummary",
  "title" : "Patient summary model",
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
  "description" : "The model is a structured document designed to provide an overview of a patient's most important health information. The model aims to be compatible with the ISO International Patient Summary standard.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatientSummary",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocument",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSPatientSummary",
      "path" : "EHDSPatientSummary",
      "short" : "Patient summary model",
      "definition" : "The model is a structured document designed to provide an overview of a patient's most important health information. The model aims to be compatible with the ISO International Patient Summary standard."
    },
    {
      "id" : "EHDSPatientSummary.header",
      "path" : "EHDSPatientSummary.header",
      "short" : "Patient summary header."
    },
    {
      "id" : "EHDSPatientSummary.header.author[x]",
      "path" : "EHDSPatientSummary.header.author[x]",
      "short" : "Author of the document."
    },
    {
      "id" : "EHDSPatientSummary.header.documentCategory",
      "path" : "EHDSPatientSummary.header.documentCategory",
      "short" : "Broad category of document (e.g. 60591-5 Patient summary document)."
    },
    {
      "id" : "EHDSPatientSummary.header.documentType",
      "path" : "EHDSPatientSummary.header.documentType",
      "short" : "Type of document (e.g. 60591-5 Patient summary document)."
    },
    {
      "id" : "EHDSPatientSummary.header.documentTitle",
      "path" : "EHDSPatientSummary.header.documentTitle",
      "short" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may contain further information. Example: ‘Patient summary of Jane Green 10.12.2024’."
    },
    {
      "id" : "EHDSPatientSummary.header.period",
      "path" : "EHDSPatientSummary.header.period",
      "max" : "0"
    },
    {
      "id" : "EHDSPatientSummary.header.legalAuthentication",
      "path" : "EHDSPatientSummary.header.legalAuthentication",
      "short" : "Document legal authentication details."
    },
    {
      "id" : "EHDSPatientSummary.header.legalAuthentication.legalAuthenticator[x]",
      "path" : "EHDSPatientSummary.header.legalAuthentication.legalAuthenticator[x]",
      "short" : "The person or organisation taking responsibility for the content of the document."
    },
    {
      "id" : "EHDSPatientSummary.header.legalAuthentication.dateTime",
      "path" : "EHDSPatientSummary.header.legalAuthentication.dateTime",
      "short" : "Date and time when the document was authenticated."
    },
    {
      "id" : "EHDSPatientSummary.header.eventCategory",
      "path" : "EHDSPatientSummary.header.eventCategory",
      "short" : "Categorisation of the event covered by the document (e.g. in the case of a partial patient summary related to a specific context). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes.",
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), LOINC"
      }
    },
    {
      "id" : "EHDSPatientSummary.presentedForm",
      "path" : "EHDSPatientSummary.presentedForm",
      "short" : "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document."
    },
    {
      "id" : "EHDSPatientSummary.alerts",
      "path" : "EHDSPatientSummary.alerts",
      "short" : "Section: Alerts.",
      "definition" : "Section: Alerts.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.alerts.generatedNarrative",
      "path" : "EHDSPatientSummary.alerts.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.alerts.medicalAlert",
      "path" : "EHDSPatientSummary.alerts.medicalAlert",
      "short" : "Medical alerts.",
      "definition" : "Medical alerts.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAlert"
      }]
    },
    {
      "id" : "EHDSPatientSummary.allergiesAndIntolerances",
      "path" : "EHDSPatientSummary.allergiesAndIntolerances",
      "short" : "Section: Allergies and intolerances.",
      "definition" : "Section: Allergies and intolerances.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.allergiesAndIntolerances.generatedNarrative",
      "path" : "EHDSPatientSummary.allergiesAndIntolerances.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.allergiesAndIntolerances.allergyIntolerance",
      "path" : "EHDSPatientSummary.allergiesAndIntolerances.allergyIntolerance",
      "short" : "Allergy or intolerance.",
      "definition" : "Allergy or intolerance.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAllergyIntolerance"
      }]
    },
    {
      "id" : "EHDSPatientSummary.allergiesAndIntolerances.emptyReason",
      "path" : "EHDSPatientSummary.allergiesAndIntolerances.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.problems",
      "path" : "EHDSPatientSummary.problems",
      "short" : "Section: Medical problems.",
      "definition" : "Section: Medical problems.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.problems.generatedNarrative",
      "path" : "EHDSPatientSummary.problems.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.problems.emptyReason",
      "path" : "EHDSPatientSummary.problems.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no problem entries are present. Where information on problems is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no problem entries are present. Where information on problems is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.problems.currentProblem",
      "path" : "EHDSPatientSummary.problems.currentProblem",
      "short" : "Active health conditions affecting the health of the patient.",
      "definition" : "Active health conditions affecting the health of the patient.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }]
    },
    {
      "id" : "EHDSPatientSummary.problems.pastProblem",
      "path" : "EHDSPatientSummary.problems.pastProblem",
      "short" : "Relevant past conditions the patient has suffered from that are no longer under currentProblem.",
      "definition" : "Relevant past conditions the patient has suffered from that are no longer under currentProblem.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicationSummary",
      "path" : "EHDSPatientSummary.medicationSummary",
      "short" : "Section: Medication summary.",
      "definition" : "Section: Medication summary.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicationSummary.generatedNarrative",
      "path" : "EHDSPatientSummary.medicationSummary.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicationSummary.emptyReason",
      "path" : "EHDSPatientSummary.medicationSummary.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no medication entries are present. Where information on medications is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no medication entries are present. Where information on medications is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.medicationSummary.medicationUse",
      "path" : "EHDSPatientSummary.medicationSummary.medicationUse",
      "short" : "Use of medicinal product relevant for this patient summary. Typically, medicinal products whose period of time indicated for the treatment has not yet expired, whether it has been dispensed or not.",
      "definition" : "Use of medicinal product relevant for this patient summary. Typically, medicinal products whose period of time indicated for the treatment has not yet expired, whether it has been dispensed or not.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationUse"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicalDevicesAndImplants",
      "path" : "EHDSPatientSummary.medicalDevicesAndImplants",
      "short" : "Section: Medical devices and implants.",
      "definition" : "Section: Medical devices and implants.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicalDevicesAndImplants.generatedNarrative",
      "path" : "EHDSPatientSummary.medicalDevicesAndImplants.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.medicalDevicesAndImplants.emptyReason",
      "path" : "EHDSPatientSummary.medicalDevicesAndImplants.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no medical device or implant entries are present. Where information on devices and implants is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no medical device or implant entries are present. Where information on devices and implants is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.medicalDevicesAndImplants.deviceUse",
      "path" : "EHDSPatientSummary.medicalDevicesAndImplants.deviceUse",
      "short" : "Implanted and external medical devices and equipment.",
      "definition" : "Implanted and external medical devices and equipment.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDeviceUse"
      }]
    },
    {
      "id" : "EHDSPatientSummary.procedures",
      "path" : "EHDSPatientSummary.procedures",
      "short" : "Section: Procedures.",
      "definition" : "Section: Procedures.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.procedures.generatedNarrative",
      "path" : "EHDSPatientSummary.procedures.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.procedures.emptyReason",
      "path" : "EHDSPatientSummary.procedures.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no procedure entries are present. Where information on procedures is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no procedure entries are present. Where information on procedures is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.procedures.procedure",
      "path" : "EHDSPatientSummary.procedures.procedure",
      "short" : "List of procedures.",
      "definition" : "List of procedures.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSProcedure"
      }]
    },
    {
      "id" : "EHDSPatientSummary.immunisations",
      "path" : "EHDSPatientSummary.immunisations",
      "short" : "Section: Immunisations.",
      "definition" : "Section: Immunisations.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.immunisations.generatedNarrative",
      "path" : "EHDSPatientSummary.immunisations.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.immunisations.emptyReason",
      "path" : "EHDSPatientSummary.immunisations.emptyReason",
      "short" : "Reason for absence of data. The field shall be present when no immunisation entries are present. Where information on immunisations is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "definition" : "Reason for absence of data. The field shall be present when no immunisation entries are present. Where information on immunisations is available only as unstructured text, emptyReason shall have the value ‘as-text’.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Data Absent Reason"
      }
    },
    {
      "id" : "EHDSPatientSummary.immunisations.immunisation",
      "path" : "EHDSPatientSummary.immunisations.immunisation",
      "short" : "Immunisation.",
      "definition" : "Immunisation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation"
      }]
    },
    {
      "id" : "EHDSPatientSummary.functionalStatus",
      "path" : "EHDSPatientSummary.functionalStatus",
      "short" : "Section: Functional status.",
      "definition" : "Section: Functional status.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.functionalStatus.generatedNarrative",
      "path" : "EHDSPatientSummary.functionalStatus.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.functionalStatus.condition",
      "path" : "EHDSPatientSummary.functionalStatus.condition",
      "short" : "Last assessment results recorded regarding conditions describing the patient’s functional status or disability.",
      "definition" : "Last assessment results recorded regarding conditions describing the patient’s functional status or disability.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCondition"
      }]
    },
    {
      "id" : "EHDSPatientSummary.functionalStatus.assessment",
      "path" : "EHDSPatientSummary.functionalStatus.assessment",
      "short" : "Last assessment results regarding functional status.",
      "definition" : "Last assessment results regarding functional status.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSPatientSummary.socialHistory",
      "path" : "EHDSPatientSummary.socialHistory",
      "short" : "Section: Social history.",
      "definition" : "Section: Social history.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.socialHistory.generatedNarrative",
      "path" : "EHDSPatientSummary.socialHistory.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.socialHistory.observation",
      "path" : "EHDSPatientSummary.socialHistory.observation",
      "short" : "Health-related lifestyle factors or lifestyle observations and social determinants of health. Example: cigarette smoker, alcohol consumption.",
      "definition" : "Health-related lifestyle factors or lifestyle observations and social determinants of health. Example: cigarette smoker, alcohol consumption.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSPatientSummary.pregnancyHistory",
      "path" : "EHDSPatientSummary.pregnancyHistory",
      "short" : "Section: Pregnancy history.",
      "definition" : "Section: Pregnancy history.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.pregnancyHistory.generatedNarrative",
      "path" : "EHDSPatientSummary.pregnancyHistory.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.pregnancyHistory.currentPregnancyStatus",
      "path" : "EHDSPatientSummary.pregnancyHistory.currentPregnancyStatus",
      "short" : "Current pregnancy status.",
      "definition" : "Current pregnancy status.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCurrentPregnancyStatus"
      }]
    },
    {
      "id" : "EHDSPatientSummary.pregnancyHistory.previousPregnancies",
      "path" : "EHDSPatientSummary.pregnancyHistory.previousPregnancies",
      "short" : "History of previous pregnancies.",
      "definition" : "History of previous pregnancies.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPregnancyHistory"
      }]
    },
    {
      "id" : "EHDSPatientSummary.travelHistory",
      "path" : "EHDSPatientSummary.travelHistory",
      "short" : "Section: Travel history.",
      "definition" : "Section: Travel history.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.travelHistory.generatedNarrative",
      "path" : "EHDSPatientSummary.travelHistory.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.travelHistory.travelHistory",
      "path" : "EHDSPatientSummary.travelHistory.travelHistory",
      "short" : "Travel history for one country.",
      "definition" : "Travel history for one country.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSTravelHistory"
      }]
    },
    {
      "id" : "EHDSPatientSummary.patientStory",
      "path" : "EHDSPatientSummary.patientStory",
      "short" : "Section: Patient story. A concise narrative from the patient’s perspective about their present health state. This is a record of things that a person feels are important to communicate about their needs, strengths, values, concerns and preferences to others providing support and care.",
      "definition" : "Section: Patient story. A concise narrative from the patient’s perspective about their present health state. This is a record of things that a person feels are important to communicate about their needs, strengths, values, concerns and preferences to others providing support and care.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.patientStory.generatedNarrative",
      "path" : "EHDSPatientSummary.patientStory.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.advanceDirectives",
      "path" : "EHDSPatientSummary.advanceDirectives",
      "short" : "Section: Advance directives.",
      "definition" : "Section: Advance directives.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.advanceDirectives.generatedNarrative",
      "path" : "EHDSPatientSummary.advanceDirectives.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.advanceDirectives.advanceDirective",
      "path" : "EHDSPatientSummary.advanceDirectives.advanceDirective",
      "short" : "Provision for healthcare decisions if, in the future, a person is unable to make those decisions.",
      "definition" : "Provision for healthcare decisions if, in the future, a person is unable to make those decisions.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAdvanceDirective"
      }]
    },
    {
      "id" : "EHDSPatientSummary.observationResults",
      "path" : "EHDSPatientSummary.observationResults",
      "short" : "Section: Observation results.",
      "definition" : "Section: Observation results.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.observationResults.generatedNarrative",
      "path" : "EHDSPatientSummary.observationResults.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.observationResults.result",
      "path" : "EHDSPatientSummary.observationResults.result",
      "short" : "Observation results pertaining to the patient’s health condition.",
      "definition" : "Observation results pertaining to the patient’s health condition.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSPatientSummary.carePlans",
      "path" : "EHDSPatientSummary.carePlans",
      "short" : "Section: Care plans.",
      "definition" : "Section: Care plans.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSPatientSummary.carePlans.generatedNarrative",
      "path" : "EHDSPatientSummary.carePlans.generatedNarrative",
      "short" : "Narrative, potentially formatted, content of the whole section.",
      "definition" : "Narrative, potentially formatted, content of the whole section.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSPatientSummary.carePlans.carePlan",
      "path" : "EHDSPatientSummary.carePlans.carePlan",
      "short" : "Describes the intention of how one or more practitioners intend to deliver care for the patient for a period of time, possibly limited to care for a specific condition or set of conditions.",
      "definition" : "Describes the intention of how one or more practitioners intend to deliver care for the patient for a period of time, possibly limited to care for a specific condition or set of conditions.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSCarePlan"
      }]
    }]
  }
}

```
