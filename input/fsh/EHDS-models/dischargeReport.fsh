Logical: EHDSDischargeReport
Parent: EHDSDocument
Title: "Discharge report model"
Description: "Discharge report."

* header 1..1
//* header only Base
* header ^short = "Discharge report Document header."
  * language 0..1
  * language only CodeableConcept
  * language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."
     //* insert Full(#SHALL)
  * documentType 1..1
  * documentType only CodeableConcept
  * documentType ^short = "Type of document e.g. 34105-7 Hospital discharge summary."
     //* insert Basic(#SHOULD)
  * documentTitle 1..1
  * documentTitle only string
  * documentTitle ^short = "Human readable document title that can be displayed in search results, etc. This can be documentType's display name or it can contain further information. Example: 'Hospital discharge report. Jane Green. 07.10.2025-10.10.2025')."
     //* insert Basic(#SHOULD)
  * period 0..1
  * period only Period
  * period ^short = "Time period of information covered in the document."
     //* insert Full(#SHALL)
  * attestation
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * dateTime
       //* insert Basic(#SHOULD)
  * legalAuthentication
     //* insert Basic(#SHOULD)
    * legalAuthenticator[x]
       //* insert Basic(#SHOULD)
    * dateTime
       //* insert Basic(#SHOULD)
  * eventCategory 0..*
  * eventCategory only CodeableConcept
  * eventCategory ^short = "Categorisation of the event covered by the document (e.g. discharge type). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes."
     //* insert Full(#SHALL)
    * ^binding.description = "SNOMED GPS (preferred), LOINC"
  * serviceSpecialty 0..*
  * serviceSpecialty only CodeableConcept
  * serviceSpecialty ^short = "Additional details about where the content was created (e.g. clinical specialty)"
     //* insert Full(#SHALL)
  * custodian
     //* insert Full(#SHALL)
  * intendedRecipient[x] 0..* EHDSRelatedPerson or EHDSHealthProfessional or EHDSOrganisation "Intended recipient of the information, i.e. a person or organisation that should be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
* body 0..1 Base "Discharge report structured body."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * alerts 0..1 Base "Section: Alerts."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * medicalAlert 0..* EHDSAlert "Medical alerts relevant in the context of the encounter."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * encounterInformation 1..1 Base "Section: Encounter information."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * encounter 1..1 EHDSEncounter "Encounter information."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the health professional."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * admissionEvaluation 0..1 Base "Section: Admission evaluation. Admission evaluation section should be reported only if it is relevant to ensure continuity of care."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
    * objectiveFindings 0..* EHDSObservation "Objective findings, such as anthropometric measurements, vital signs, or objective anatomical findings of physical examination."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * functionalStatus[x] 0..* EHDSCondition or EHDSObservation "An individual's ability to perform normal daily activities required to meet basic needs, fulfil usual roles and maintain health and well-being."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the evaluation performer."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * patientHistory 0..1 Base "Section: Patient health history (anamnesis) containing only information that is highly relevant for this specific episode of care. The model is designed with the expectation that patient summary is available."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section. In case the section includes structured information, it should also be included in generatedNarrative."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * pastProblems[x] 0..* EHDSCondition or EHDSObservation "A list of conditions of a patient that the patient suffered in the past or still suffers. Unlike diagnostic summary, medical history is not only a list of problems, but could contain broader description of the condition and its progress, details about treatment including medication and patient response to treatment. Past problem section (unlike the same section of the patient summary) should include only conditions that are important for continuity of care. This section, if provided, complements the diagnostic summary section of the discharge report."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * devicesAndImplants 0..* EHDSDeviceUse "Devices and implants in patient anamnesis."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * procedures 0..* EHDSProcedure "Procedures in patient anamnesis."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the health professional."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * courseOfEncounter 1..1 Base "Section: Course of inpatient or outpatient encounter."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * conditionSummary 1..* EHDSCondition "Conditions that were treated or affected provisioning of care (diagnostics, therapy, nursing, monitoring) during the encounter. At least one attended condition should be marked. Other conditions are recorded only if they are important for continuity of care (after discharge)."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * procedures 0..* EHDSProcedure "Procedures performed during encounter which are significant for continuity of care, e.g. surgeries and other instrumental interventions (endoscopic, intravascular), chemotherapy, radiotherapy, purification methods (dialysis, hemoperfusion), circulation support methods (counterpulsation, etc.), administration of blood derivatives or others. Diagnostic procedures are typically captured as observation results and not repeated here."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * medicalDevicesAndImplants 0..* EHDSDeviceUse "Medical devices (including implants) whose use was started, stopped, or otherwise modified during the encounter."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * pharmacotherapy 0..* EHDSMedicationUse "Significant medication treatments during encounter."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * objectiveFindings 0..* EHDSObservation "Objective findings, such as anthropometric measurements, vital signs, or objective anatomical findings of physical examination. The line between objective findings and test results is not clear and it is up to the implementers to decide how to logically display different measurements."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * testResults[x] 0..* EHDSObservation or EHDSLaboratoryObservation "Significant medical test results of functional, diagnostic (including laboratory), and imaging examinations performed during encounter."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the health professional."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * dischargeDetails 0..1 Base "Section: Discharge details."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * objectiveFindings 0..* EHDSObservation "Objective findings, such as anthropometric measurements, vital signs, or objective anatomical findings of physical examination."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * functionalStatus[x] 0..* EHDSCondition or EHDSObservation "An individual's ability to perform normal daily activities required to meet basic needs, fulfil usual roles and maintain health and well-being."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the health professional."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * medicationSummary 0..1 Base "Summary information on the medication recommended for the period after discharge, indicating whether the medication is changed or newly started. Compared to previous practices, the overview is supplemented with medication that has been discontinued."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * medicationUse 0..* EHDSMedicationUse "Details about medication and dosage."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
    * note 0..1 string "Free text notes by the health professional."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
  * carePlan 0..1 Base "Section: Care plan and other recommendations after discharge."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * generatedNarrative 0..1 Narrative "Narrative, potentially formatted, content of the whole section."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
    * structuredCarePlan 0..* EHDSCarePlan "Structured care plan after discharge."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * otherRecommendations 0..1 string "Other recommendations (advice) after discharge. E.g., recommendation to suggest hip replacement, reduce number of cigarettes, stop smoking, increase physical exercises, etc."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
* attachment 0..* EHDSAttachment "Report attachment."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.attestation.attester[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.attestation.dateTime
  // from EHDSDocument
   //* insert Full(#SHALL)
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
   //* insert Basic(#SHOULD)
* header.date
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.documentTitle
  // from EHDSDocument
   //* insert Full(#SHALL)
* header.documentType
  // from EHDSDocument
   //* insert Full(#SHALL)
* header.eventCategory
  // from EHDSDocument
   //* insert Basic(#SHOULD)
* header.identifier
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.language
  // from EHDSDataSet
   //* insert Basic(#SHOULD)
* header.legalAuthentication
  // from EHDSDocument
   //* insert Full(#SHALL)
* header.legalAuthentication.dateTime
  // from EHDSDocument
   //* insert Full(#SHALL)
* header.legalAuthentication.legalAuthenticator[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
* header.period
  // from EHDSDocument
   //* insert Basic(#SHOULD)
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
