Logical: EHDSImagingReport
Parent: EHDSDocument
Title: "Imaging report model"
Description: "Imaging report model."

* header
  * identifier ^short = "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
  * author[x]
    * insert Basic(#SHOULD)
  * date ^short = "Date and optionally time of authoring/issuing"
  * status
    * ^binding.description = "HL7 Imaging Study Status"
  * language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."
    * insert Full(#SHALL)
  * documentType ^short = "Type of document (e.g. 18748-4 Diagnostic imaging study)."
    * insert Basic(#SHOULD)
  * documentTitle ^short = "Human readable document title that can be displayed in search results, etc. This can be documentType's display name, or it can contain further information."
    * insert Basic(#SHOULD)
  * period ^short = "Time of service (imaging study) that is being documented."
    * insert Full(#SHALL)
  * version
    * insert Basic(#SHOULD)
  * attestation
    * insert Full(#SHALL)
    * dateTime ^short = "Date and time of the approval of the document by the attester"
  * legalAuthentication ^short = "Document legal authentication details"
    * insert Basic(#SHOULD)
    * legalAuthenticator[x]
      * insert Basic(#SHOULD)
    * dateTime ^short = "Date and time when the document was authorised"
  * eventCategory ^short = "Categorisation of the event covered by the document (e.g. imaging study types, body regions, modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes."
    * ^binding.description = "DICOM CID 33 Modality (preferred), SNOMED GPS"
  * serviceSpecialty ^short = "Additional details about where the content was created (e.g. clinical specialty)"
  * accessionNumber 0..* Identifier "Accession number - an identifier, managed by the RIS at the local level, which usually uniquely identifies an imaging procedure request, and links it to imaging study and related imaging report."
    * insert Full(#SHALL)
    * insert Basic(#SHOULD)
  * intendedRecipient[x] 0..* EHDSPatient or EHDSRelatedPerson or EHDSHealthProfessional or EHDSOrganisation "Information recipient (intended recipient of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
* body 0..1 Base "Imaging report structured body."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
  * orderInformation 0..* Base "Order to which this imaging report is linked."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * orderId 1..* Identifier "Identifier of the imaging service order."
      * insert Full(#SHALL)
      * insert Basic(#SHALL)
    * orderDateAndTime 0..1 dateTime "Date and time of the order placement."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * orderPlacer[x] 0..1 EHDSHealthProfessional or EHDSOrganisation or EHDSPatient "The person/organisation authorised to place the order."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * orderReason[x] 0..* CodeableConcept or EHDSCondition or EHDSObservation or string "An explanation or justification for why this service is being requested."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
      * ^binding.description = "SNOMED GPS (preferred), ICD-10"
      * ^binding.strength = #required
    * clinicalQuestion 0..1 string "Specification of clinical question (goal of the investigation) to be answered by the imaging investigation."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
  * supportingInformation 0..1 Base "This information includes diagnosis, clinical findings and other observations. This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the metal implants present in patient's body."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * observation 0..* EHDSObservation "Clinical findings and other observations (e.g., height and weight of the patient)."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * condition 0..* EHDSCondition "Condition that may influence the service or result interpretation."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * priorMedicationAdministration 0..* EHDSMedicationUse "Medication administered before ordering the service that may influence the service or result interpretation."
      * insert Full(#SHOULD)
    * device 0..* EHDSDeviceUse "List of implants or devices that affect the course of the examination or its interpretation (e.g. metal implants)."
      * insert Full(#SHOULD)
    * pregnancyStatus 0..1 EHDSCurrentPregnancyStatus "Pregnancy status when the imaging examination was performed, e.g., pregnant, not pregnant, unknown."
      * insert Full(#SHOULD)
  * specimen 0..* EHDSSpecimen "Specimen information."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * exposureInformation 0..1 Base "Information on total exposure during the imaging investigation to ionising radiation."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * summary 0..1 string "Summary information about the exposure to ionised radiation."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * structuredDose 0..* Base "Structured representation of the exposure."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
      * doseQuantity 0..1 Quantity "Ionised radiation received during the imaging investigation."
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
        * ^binding.description = "UCUM for units"
        * ^binding.strength = #required
      * doseModality 0..1 CodeableConcept "Imaging modality used during imaging investigation (DICOM CID029)."
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
        * ^binding.description = "DICOM Modality"
        * ^binding.strength = #required
      * bodySite 0..1 EHDSBodyStructure "Body part investigated."
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
      * numberOfSeries 0..1 integer "Number of series in the study."
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
  * examinationReport 1..1 Base "Examination report content."
    * insert Full(#SHALL)
    * insert Basic(#SHOULD)
    * modality 1..* CodeableConcept "Imaging modality used during imaging investigation (DICOM CID029)."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
      * ^binding.description = "DICOM Modality"
      * ^binding.strength = #required
    * bodySite 0..* EHDSBodyStructure "Body part investigated."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * imagingProcedure 0..* EHDSProcedure "Imaging procedure performed during imaging study."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * medicationAdministration 0..* EHDSMedicationAdministration "Information about medications administered (contrast, sedation, stress agents, etc) to enable the imaging investigation or during it."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * adverseReaction 0..* EHDSAllergyIntolerance "Adverse reaction manifested during imaging investigation."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * results[x] 0..* EHDSObservation or string "Imaging report result data."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * conclusion 0..1 Base "A concise and clinically contextualised summary including interpretation/impression of the diagnostic report."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
      * impression 1..1 string "Narrative description of the clinical conclusion (impression)."
        * insert Full(#SHALL)
        * insert Basic(#SHOULD)
      * conditionOrFinding[x] 0..* EHDSCondition or EHDSObservation "Condition or finding from imaging investigation."
        * insert Full(#SHALL)
        * insert Basic(#SHOULD)
  * recommendation 0..1 Base "Recommendation section for additional imaging investigations or other actions."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * description 1..1 string "Narrative description of the recommended activities including additional investigation, medication etc."
      * insert Full(#SHALL)
      * insert Basic(#SHOULD)
    * carePlan 0..* EHDSCarePlan "A complex and structured information about recommended goals, activities and objectives in the form of one or more formal care plan to be implemented after this imaging investigation."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
  * comparisonStudy 0..* EHDSImagingReport "Documentation (reference) of a prior Imaging Report to which the current images were compared."
    * insert Full(#SHALL)
    * insert Basic(#SHOULD)
* dicomStudyMetadata 0..* EHDSImagingStudy "Metadata of the DICOM study. A study comprises a set of series, each of which includes a set of Service-Object Pair Instances (SOP Instances - images or other data) acquired or produced in a common context. A series is of only one modality (e.g. X-ray, CT, MR, ultrasound), but a study may have multiple series of different modalities."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* attachments 0..* EHDSAttachment "Report attachments."
  * insert Full(#SHALL)
  * insert Basic(#SHALL)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.attestation
  // from EHDSDocument
  * insert Basic(#SHOULD)
* header.attestation.attester[x]
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.attestation.dateTime
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.author[x]
  // from EHDSDocument
  * insert Full(#SHALL)
  //* insert Basic(#SHALL)
* header.countryOfOrigin
  // from EHDSDocument
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.custodian
  // from EHDSDocument
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.date
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.documentTitle
  // from EHDSDocument
  * insert Full(#SHALL)
* header.documentType
  // from EHDSDocument
  * insert Full(#SHALL)
* header.eventCategory
  // from EHDSDocument
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.identifier
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.language
  // from EHDSDataSet
  * insert Basic(#SHOULD)
* header.legalAuthentication
  // from EHDSDocument
  * insert Full(#SHALL)
* header.legalAuthentication.dateTime
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.legalAuthentication.legalAuthenticator[x]
  // from EHDSDocument
  * insert Full(#SHALL)
* header.period
  // from EHDSDocument
  * insert Basic(#SHOULD)
* header.serviceSpecialty
  // from EHDSDocument
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.status
  // from EHDSDataSet, EHDSDocument
  * insert Basic(#SHALL)
  * insert Full(#SHALL)
* header.subject
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.version
  // from EHDSDocument
  * insert Full(#SHALL)
* presentedForm
  // from EHDSDocument
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
// End of obligations propagated from parent models.
