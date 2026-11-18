Logical: EHDSPatientSummary
Parent: EHDSDocument
Title: "Patient summary model"
Description: "The model is a structured document designed to provide an overview of a patient's most important health information. The model aims to be compatible with the ISO International Patient Summary standard."

* header 1..1
//* header only Base
* header ^short = "Patient summary header."
  * documentCategory ^short = "Broad category of document (e.g. 60591-5 Patient summary document)."
  * documentType ^short = "Type of document (e.g. 60591-5 Patient summary document)."
  * documentTitle 1..1
  * documentTitle only string
  * documentTitle ^short = "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may contain further information. Example: ‘Patient summary of Jane Green 10.12.2024’."
  * attestation
    * attester[x]
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    * dateTime
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
  * eventCategory 0..*
  * eventCategory only CodeableConcept
  * eventCategory ^short = "Categorisation of the event covered by the document (e.g. in the case of a partial patient summary related to a specific context). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes."
     //* insert Full(#SHALL)
    * ^binding.description = "SNOMED GPS (preferred), LOINC"
  * serviceSpecialty
     //* insert Full(#SHALL)
* alerts 0..1 Base "Section: Alerts."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * medicalAlert 0..* EHDSAlert "Medical alerts."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* allergiesAndIntolerances 0..1 Base "Section: Allergies and intolerances."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * allergyIntolerance 0..* EHDSAllergyIntolerance "Allergy or intolerance."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
* problems 0..1 Base "Section: Medical problems."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no problem entries are present. Where information on problems is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
  * currentProblem 0..* EHDSCondition "Active health conditions affecting the health of the patient."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * pastProblem 0..* EHDSCondition "Relevant past conditions the patient has suffered from that are no longer under currentProblem."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* medicationSummary 0..1 Base "Section: Medication summary."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no medication entries are present. Where information on medications is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
  * medicationUse 0..* EHDSMedicationUse "Use of medicinal product relevant for this patient summary. Typically, medicinal products whose period of time indicated for the treatment has not yet expired, whether it has been dispensed or not."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* medicalDevicesAndImplants 0..1 Base "Section: Medical devices and implants."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no medical device or implant entries are present. Where information on devices and implants is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
  * deviceUse 0..* EHDSDeviceUse "Implanted and external medical devices and equipment."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* procedures 0..1 Base "Section: Procedures."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no procedure entries are present. Where information on procedures is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
  * procedure 0..* EHDSProcedure "List of procedures."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* immunisations 0..1 Base "Section: Immunisations."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * emptyReason 0..1 CodeableConcept "Reason for absence of data. The field shall be present when no immunisation entries are present. Where information on immunisations is available only as unstructured text, emptyReason shall have the value ‘as-text’."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
  * immunisation 0..* EHDSImmunisation "Immunisation."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* functionalStatus 0..1 Base "Section: Functional status."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * condition 0..* EHDSCondition "Last assessment results recorded regarding conditions describing the patient’s functional status or disability."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * assessment 0..* EHDSObservation "Last assessment results regarding functional status."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* socialHistory 0..1 Base "Section: Social history."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * observation 0..* EHDSObservation "Health-related lifestyle factors or lifestyle observations and social determinants of health. Example: cigarette smoker, alcohol consumption."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* pregnancyHistory 0..1 Base "Section: Pregnancy history."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * currentPregnancyStatus 0..1 EHDSCurrentPregnancyStatus "Current pregnancy status."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * previousPregnancies 0..* EHDSPregnancyHistory "History of previous pregnancies."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* travelHistory 0..1 Base "Section: Travel history."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * travelHistory 0..* EHDSTravelHistory "Travel history for one country."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* patientStory 0..1 Base "Section: Patient story. A concise narrative from the patient’s perspective about their present health state. This is a record of things that a person feels are important to communicate about their needs, strengths, values, concerns and preferences to others providing support and care."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
* advanceDirectives 0..1 Base "Section: Advance directives."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * advanceDirective 0..* EHDSAdvanceDirective "Provision for healthcare decisions if, in the future, a person is unable to make those decisions."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* observationResults 0..1 Base "Section: Observation results."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * result 0..* EHDSObservation "Observation results pertaining to the patient’s health condition."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* carePlans 0..1 Base "Section: Care plans."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * carePlan 0..* EHDSCarePlan "Describes the intention of how one or more practitioners intend to deliver care for the patient for a period of time, possibly limited to care for a specific condition or set of conditions."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)

// Elements inherited from the parent model but not present in the source table.
* header.period 0..0

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.attestation
  // from EHDSDocument
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.author[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.countryOfOrigin
  // from EHDSDocument
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.custodian
  // from EHDSDocument
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.date
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.documentTitle
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.documentType
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.eventCategory
  // from EHDSDocument
   //* insert Basic(#SHOULD)
* header.identifier
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.legalAuthentication
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.legalAuthentication.dateTime
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.legalAuthentication.legalAuthenticator[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.serviceSpecialty
  // from EHDSDocument
   //* insert Basic(#SHOULD)
* header.status
  // from EHDSDataSet, EHDSDocument
   //* insert Basic(#SHALL)
   //* insert Full(#SHALL)
* header.subject
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.version
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* presentedForm
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
// End of obligations propagated from parent models.

// Element descriptions aligned with WP v5.
* header.author[x] ^short = "Author of the document."
* header.legalAuthentication ^short = "Document legal authentication details."
* header.legalAuthentication.legalAuthenticator[x] ^short = "The person or organisation taking responsibility for the content of the document."
* header.legalAuthentication.dateTime ^short = "Date and time when the document was authenticated."
* presentedForm ^short = "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document."
