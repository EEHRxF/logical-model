Logical: EHDSSearchMetadata
Title: "Data group search metadata model"
Description: "Metadata for searching individual data groups, based on WP v5 Annex III and the final review instructions. This model is independent of the resource-content model EHDSDataSet."

* ^purpose = "Search metadata is not a parent of resource-content models. Date is mandatory under final finding 6 and the user's explicit decision. Its availability when the source resource has no date is an open specification issue; no derivation or fallback rule has been agreed."

* subject 1..1 EHDSPatient "Patient/subject information."
// Implementation alignment with the optional resource identifiers/authors under finding 4.
* identifier 0..* Identifier "Unique identifier of the resource."
* clinicalEventTime[x] 0..1 dateTime or Period "Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken)."
* version 0..1 string "Version of the resource."
* author[x] 0..* EHDSHealthProfessional or EHDSOrganisation or EHDSDevice "Information describing who authored the resource."
* date 1..1 dateTime "Date of finalisation/issuance of the resource."
  * ^comment = "The user explicitly selected 1..1 in search metadata, whereas EHDSDataSet.header.date and some individual resource dates are 0..1. This unresolved mismatch requires clarification of the metadata requirement or a rule for obtaining the missing date. No fallback date is defined."
* attestation 0..* Base "Resource attestation details."
  * attester[x] 1..1 EHDSHealthProfessional or EHDSDevice "Attester who validated the resource."
  * dateTime 1..1 dateTime "Date and time of the approval of the resource by the attester."
* status 1..1 CodeableConcept "Status of the resource."
  * ^binding.description = "In accordance with the status ‘binding’ in the corresponding data group"
  * ^binding.strength = #required
* language 0..* CodeableConcept "Language in which the resource is written. Language is expressed by the IETF language tag."
  * ^binding.description = "BCP 47"
  * ^binding.strength = #required

// The user treats resourceCategory as a meta-element, not an additional field.
// Aurora 46 also proposed removing it from data-group search metadata (commit 96fb0898).
// Aurora 6 retains lastUpdate as technical metadata for searching and retrieval.

* lastUpdate 0..1 dateTime "Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time."
