Logical: EHDSDocument
Parent: EHDSDataSet
Title: "Document model"
Description: "EHDSDocument means a structured set of data elements common all health documents. Additional document search metadata is defined separately in EHDSDocumentSearchMetadata."

* header ^short = "Document header."
  * identifier 1..*
    * ^short = "Unique identifier of the document."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * author[x] 1..*
  * author[x] only EHDSHealthProfessional or EHDSOrganisation or EHDSDevice
    * ^short = "Information describing who authored the resource or document."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * date 1..1
    * ^short = "Date of finalisation/issuance of the document."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  // Aurora 6: lastUpdate belongs to search metadata, not document content.
  // * lastUpdate ^short = "Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time."
  * status
    * ^short = "Status of the document."
    //  //* insert Basic(#SHALL)
    * ^binding.description = "HL7 Composition Status"
    * ^binding.strength = #required
  * documentCategory 1..1 CodeableConcept "Broad category of document (e.g. 11502-2 Laboratory report)."
    * ^binding.description = "LOINC"
    * ^binding.strength = #required
  * documentType 1..1 CodeableConcept "Type of document (e.g. 18725-2 Microbiology studies (set))."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
    * ^binding.description = "LOINC"
    * ^binding.strength = #required
  * documentTitle 1..1 string "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * period 0..1 Period "Time of service that is being documented."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
  * version 1..1
    * ^short = "Version of the document."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * attestation 0..* Base "Document attestation details."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    * attester[x] 1..1 EHDSHealthProfessional or EHDSDevice "Attester who validated the document."
      //  //* insert Full(#SHALL)
      //  //* insert Basic(#SHALL)
    * dateTime 1..1 dateTime "Date and time of the approval of the document by the attester."
      //  //* insert Full(#SHALL)
      //  //* insert Basic(#SHALL)
  * legalAuthentication 0..* Base "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
    * legalAuthenticator[x] 1..1 EHDSHealthProfessional or EHDSOrganisation "The person taking responsibility for the medical content of the document. legalAuthenticator may be different from author and attester (e.g author=junior doctor, attester=senior physician, legalAuthenticator= attending physician)."
      //  //* insert Full(#SHALL)
      //  //* insert Basic(#SHALL)
    * dateTime 1..1 dateTime "Date and time when the document was authorised."
      //  //* insert Full(#SHALL)
      //  //* insert Basic(#SHALL)
  * eventCategory 0..* CodeableConcept "Categorisation of the event covered by the document (e.g. laboratory study types, imaging study types including modality). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS, LOINC, DICOM CID 33 Modality"
    * ^binding.strength = #required
  * serviceSpecialty 0..* CodeableConcept "Additional details about where the content was created (e.g. clinical speciality)."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * custodian 0..1 EHDSOrganisation "Organisation that is in charge of maintaining the document."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
  * countryOfOrigin 0..1 CodeableConcept "Country of origin of the document."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    * ^binding.description = "ISO 3166-1 alpha-2"
    * ^binding.strength = #required
* presentedForm 0..* EHDSAttachment "A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document."
  //  //* insert Full(#SHALL)
  //  //* insert Basic(#SHALL)

// Elements inherited from the parent model but not present in the source table.
//* header.patientInsertedData 0..0

// Obligations propagated from parent models (commented because this model is a parent of another model).
// * header
//   // from EHDSDataSet
//    //* insert Full(#SHALL)
//    //* insert Basic(#SHALL)
// * header.author[x]
//   // from EHDSDataSet
//    //* insert Full(#SHOULD)
//    //* insert Basic(#SHOULD)
// * header.date
//   // from EHDSDataSet
//    //* insert Full(#SHOULD)
//    //* insert Basic(#SHOULD)
// * header.identifier
//   // from EHDSDataSet
//    //* insert Full(#SHOULD)
//    //* insert Basic(#SHOULD)
// * header.status
//   // from EHDSDataSet
//    //* insert Full(#SHALL)
//    //* insert Basic(#SHOULD)
// * header.subject
//   // from EHDSDataSet
//    //* insert Full(#SHALL)
//    //* insert Basic(#SHALL)
// End of obligations propagated from parent models.

// Element descriptions aligned with WP v5.
* header.language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."

// Aurora 45 and 6, commit 96fb0898: search metadata is not inherited into document content.
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
