Logical: EHDSMedicalTestReport
Parent: EHDSDocument
Title: "Medical test result and report model"
Description: "Medical test results, including laboratory and other diagnostic results and related reports."

* header
  * date 1..1
  * date only dateTime
  * date ^short = "Date and optionally time of authoring/issuing."
  * language
     //* insert Full(#SHALL)
  * documentType 1..1
  * documentType only CodeableConcept
  * documentType ^short = "Type of document (e.g., 11502-2 'Laboratory report' or 18759-1 'Spirometry study')."
  * documentTitle 1..1
  * documentTitle only string
  * documentTitle ^short = "Human readable document title that can be displayed in search results, etc. This can be documentType's display name, or it can be assembled from multiple elements. Examples: Medical test report'."
     //* insert Basic(#SHOULD)
  * period
     //* insert Full(#SHALL)
  * version
     //* insert Basic(#SHOULD)
  * attestation
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * legalAuthentication
    * legalAuthenticator[x] 1..1
    * legalAuthenticator[x] only EHDSHealthProfessional or EHDSOrganisation
    * legalAuthenticator[x] ^short = "The person or organization taking responsibility for the content of the document."
    * dateTime 1..1
    * dateTime only dateTime
    * dateTime ^short = "Date and time when the document was authorised."
  * eventCategory 0..*
  * eventCategory only CodeableConcept
  * eventCategory ^short = "Categorisation of the event covered by the document (e.g. medical study types etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes."
     //* insert Full(#SHALL)
    * ^binding.description = "LOINC (preferred), SNOMED GPS"
  * serviceSpecialty
     //* insert Full(#SHALL)
  * custodian
     //* insert Full(#SHALL)
* intendedRecipient[x] 0..* EHDSPatient or EHDSRelatedPerson or EHDSHealthProfessional or EHDSOrganisation or EHDSDevice "Information recipient of the information, i.e. a person or organisation that should be notified or be aware of the content. This element is used to indicate explicit communication intent and does not represent routine storage or passive availability of information (e.g. in portals)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* body 0..1 Base "Medical test result and report structured body."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * orderInformation 0..* Base "Order information"
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * orderId 1..* Identifier "An identifier of the medical test order."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * orderDateAndTime 0..1 dateTime "Date and time of the order placement."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * orderPlacer[x] 0..1 EHDSHealthProfessional or EHDSOrganisation or EHDSPatient "The person/organisation authorised to place the order."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * orderReason[x] 0..* CodeableConcept or EHDSCondition or EHDSObservation or string "An explanation or justification for why this service is being requested."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
      * ^binding.description = "SNOMED GPS (preferred), ICD-10"
      * ^binding.strength = #required
    * clinicalQuestion 0..1 string "Specification of clinical question (goal of the investigation) to be answered by the medical test."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
  * supportingInformation 0..1 Base "Additional clinical information about the patient or specimen that may influence the services or their interpretations. This information includes diagnosis, clinical findings and other observations. In medical test ordering these are typically referred to as 'ask at order entry questions (AOEs).' This includes observations explicitly requested by the producer (filler) to provide context or supporting information needed to complete the order. For example, reporting the amount of inspired oxygen for blood gas measurements."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHALL)
    * observation 0..* EHDSObservation "Clinical findings and other observations."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHALL)
    * condition 0..* EHDSCondition "Condition that may influence the service or result interpretation."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    * medicationAdministration 0..* EHDSMedicationAdministration "Medication administered before ordering the service that may influence the service or result interpretation."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
    * immunisation 0..* EHDSImmunisation "Immunisation history that may influence the service or result interpretation."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    //* otherSupportingInformation 0..* Resource "Any other type of relevant supporting information."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
  * specimen 0..* EHDSSpecimen "Specimen information."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * resultData 1..1 Base "Medical test result data."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * comment 0..1 Narrative "Narrative, potentially formatted, such as a textual interpretation or advice accompanying the result report."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * medicalTestResult[x] 0..* EHDSObservation or EHDSLaboratoryObservation "Observation details."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
* attachments 0..* EHDSAttachment "Report attachments."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)

// Elements inherited from the parent model but not present in the source table.
//* header.countryOfOrigin 0..0

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
   //* insert Basic(#SHALL)
* header.author[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
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
   //* insert Basic(#SHALL)
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
   //* insert Basic(#SHALL)
* header.legalAuthentication.dateTime
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.legalAuthentication.legalAuthenticator[x]
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
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
* presentedForm
  // from EHDSDocument
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
// End of obligations propagated from parent models.
