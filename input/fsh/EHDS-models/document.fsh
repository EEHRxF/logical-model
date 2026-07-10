Logical: EHDSDocument
Parent: EHDSDataSet
Title: "Document model"
Description: "EHDSDocument means a structured set of data elements common all health documents."

* header ^short = "Document header."
  * identifier 1..*
    * ^short = "Unique identifier of the document."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
  * author[x] 1..*
  * author[x] only EHDSHealthProfessional or EHDSOrganisation or EHDSDevice
    * ^short = "Author of the document."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
  * date 1..1
    * ^short = "Date of finalising/issuing the document."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
  * status 1..1
    * ^short = "Status of the document."
    // * insert Basic(#SHALL)
    * ^binding.description = "HL7 Composition Status"
    * ^binding.strength = #required
  * documentType 1..1 CodeableConcept "Type of document (e.g. 60591-5 Patient summary document)."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
    * ^binding.description = "LOINC"
    * ^binding.strength = #required
  * documentTitle 1..1 string "Human readable document title that can be displayed in search results, etc. This can be documentType's display name, or it can be assembled from multiple elements. Examples: 'Laboratory Result Report', 'Patient Summary of Jane Green 10.12.2024'."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
  * period 0..1 Period "Time of service that is being documented."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
  * version 1..1 string "Version of the document."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
  * attestation 0..* Base "Document attestation details."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
    * attester[x] 1..1 EHDSHealthProfessional or EHDSDevice "Attester who validated the document."
      // * insert Full(#SHALL)
      // * insert Basic(#SHALL)
    * dateTime 1..1 dateTime "Date and time of the approval of the document by the attester."
      // * insert Full(#SHALL)
      // * insert Basic(#SHALL)
  * legalAuthentication 0..* Base "Document legal authentication details."
    // * insert Full(#SHALL)
    // * insert Basic(#SHALL)
    * legalAuthenticator[x] 1..1 EHDSHealthProfessional or EHDSOrganisation "The person or organisation taking responsibility for the content of the document."
      // * insert Full(#SHALL)
      // * insert Basic(#SHALL)
    * dateTime 1..1 dateTime "Date and time when the document was authenticated."
      // * insert Full(#SHALL)
      // * insert Basic(#SHALL)
  * eventCategory 0..* CodeableConcept "Categorisation of the event covered by the document (e.g. laboratory study types, imaging study types including modality, etc.). Selection of such tags or labels depends on the use case and agreement between data sharing parties. This meta-data element serves primarily for searching and filtering purposes."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
    * ^binding.description = "LOINC, SNOMED GPS, DICOM CID 33 Modality"
    * ^binding.strength = #required
  * serviceSpecialty 0..* CodeableConcept "Additional details about where the content was created (e.g. clinical specialty)."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * custodian 0..1 EHDSOrganisation "Organisation that is in charge of maintaining the document."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
  * countryOfOrigin 0..1 CodeableConcept "Country of origin of the document."
    // * insert Full(#SHOULD)
    // * insert Basic(#SHOULD)
    * ^binding.description = "ISO 3166-1 alpha-2"
    * ^binding.strength = #required
* presentedForm 0..* EHDSAttachment "A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document."
  // * insert Full(#SHALL)
  // * insert Basic(#SHALL)

// Elements inherited from the parent model but not present in the source table.
* header.patientInsertedData 0..0

// Obligations propagated from parent models (commented because this model is a parent of another model).
// * header
//   // from EHDSDataSet
//   * insert Full(#SHALL)
//   * insert Basic(#SHALL)
// * header.author[x]
//   // from EHDSDataSet
//   * insert Full(#SHOULD)
//   * insert Basic(#SHOULD)
// * header.date
//   // from EHDSDataSet
//   * insert Full(#SHOULD)
//   * insert Basic(#SHOULD)
// * header.identifier
//   // from EHDSDataSet
//   * insert Full(#SHOULD)
//   * insert Basic(#SHOULD)
// * header.language
//   // from EHDSDataSet
//   * insert Full(#SHOULD)
//   * insert Basic(#SHOULD)
// * header.status
//   // from EHDSDataSet
//   * insert Full(#SHALL)
//   * insert Basic(#SHOULD)
// * header.subject
//   // from EHDSDataSet
//   * insert Full(#SHALL)
//   * insert Basic(#SHALL)
// End of obligations propagated from parent models.
