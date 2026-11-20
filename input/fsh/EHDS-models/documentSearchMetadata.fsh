Logical: EHDSDocumentSearchMetadata
Parent: EHDSSearchMetadata
Title: "Document search metadata model"
Description: "Metadata for searching documents, based on WP v5 Annex III and the final review instructions. This search-metadata model is separate from EHDSDocument and its resource-content hierarchy."

* ^purpose = "Document search metadata specialises the independent search-metadata model. It does not include the document's content, presentedForm or countryOfOrigin. Date is mandatory in both this model and EHDSDocument."

* identifier 1..*
  * ^short = "Unique identifier of the document."
* clinicalEventTime[x] 0..0
* version 1..1
  * ^short = "Version of the document."
* author[x] 1..*
  * ^short = "Information describing who authored the resource or document."
* date ^short = "Date of finalisation/issuance of the document."
  * ^comment = "Final finding 6 and the user require search date 1..1. EHDSDocument.header.date is also 1..1, so document search metadata has no corresponding source-date cardinality conflict."
* attestation ^short = "Document attestation details."
  * attester[x] ^short = "Attester who validated the document."
  * dateTime ^short = "Date and time of the approval of the document by the attester."
* status
  * ^short = "Status of the document."
  * ^binding.description = "HL7 Composition Status"
  * ^binding.strength = #required
* language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."
* documentCategory 1..1 CodeableConcept "Broad category of document (e.g. 11502-2 Laboratory report)."
  * ^binding.description = "LOINC"
  * ^binding.strength = #required
* documentType 1..1 CodeableConcept "Type of document (e.g. 18725-2 Microbiology studies (set))."
  * ^binding.description = "LOINC"
  * ^binding.strength = #required
* documentTitle 1..1 string "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’."
* period 0..1 Period "Time of service that is being documented."
* legalAuthentication 0..* Base "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile."
  * legalAuthenticator[x] 1..1 EHDSHealthProfessional or EHDSOrganisation "The person taking responsibility for the medical content of the document. legalAuthenticator may be different from author and attester (e.g author=junior doctor, attester=senior physician, legalAuthenticator= attending physician)."
  * dateTime 1..1 dateTime "Date and time when the document was authorised."
* eventCategory 0..* CodeableConcept "Categorisation of the event covered by the document (e.g. laboratory study types, imaging study types including modality). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes."
  * ^binding.description = "SNOMED GPS, LOINC, DICOM CID 33 Modality"
  * ^binding.strength = #required
* serviceSpecialty 0..* CodeableConcept "Additional details about where the content was created (e.g. clinical speciality)."
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* custodian 0..1 EHDSOrganisation "Organisation that is in charge of maintaining the document."

* lastUpdate ^short = "Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time."
