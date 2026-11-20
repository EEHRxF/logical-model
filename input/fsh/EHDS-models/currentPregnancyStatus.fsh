Logical: EHDSCurrentPregnancyStatus
Parent: EHDSDataSet
Title: "Current pregnancy status model"
Description: "EHDSCurrentPregnancyStatus means a structured set of data elements describing a patient's pregnancy status at a given point in time."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status ^short = "Status of the condition."
    * ^binding.description = "HL7 Observation Status"
* currentPregnancyStatus 1..1 CodeableConcept "Pregnancy status of the patient, e.g. pregnant, not pregnant, possible pregnancy."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
//* dateOfStatus 0..1 dateTime "Effective date of the current pregnancy status."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* expectedDateOfDelivery 0..1 dateTime "Date on which the woman is due to give birth. Day, year and month are required."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* gestationalAge 0..1 string "Duration of the pregnancy (weeks, days or weeks and days) at the time of the observation."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  // A string can express weeks, days or their combination; a unit binding is not applicable.
  // * ^binding.description = "UCUM (units of measurement)"
  // * ^binding.strength = #required
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
