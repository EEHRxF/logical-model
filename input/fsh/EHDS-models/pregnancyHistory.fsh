Logical: EHDSPregnancyHistory
Parent: EHDSDataSet
Title: "Pregnancy history model"
Description: "EHDSPregnancyHistory means a structured set of data elements describing a single past pregnancy."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status ^short = "Status of this observation."
    * ^binding.description = "HL7 Observation Status"
* endDate 0..1 dateTime "The end date of the pregnancy."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* outcome 0..1 CodeableConcept "The outcome of the pregnancy."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* note 0..1 string "Free text notes by the health professional."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.author[x]
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.date
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.identifier
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.status
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* header.subject
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
// End of obligations propagated from parent models.

// Element descriptions aligned with WP v5.
* header.identifier ^short = "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
* header.author[x] ^short = "Author of the resource."

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
* header.version 0..0
// * header.attestation 0..0 // Parent element removed from EHDSDataSet.
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
