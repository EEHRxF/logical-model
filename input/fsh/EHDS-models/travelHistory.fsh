Logical: EHDSTravelHistory
Parent: EHDSDataSet
Title: "Travel history model"
Description: "EHDSTravelHistory means a structured set of data elements describing a patient's past travel to a specific country."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * date 0..1
  * date only dateTime
  * date ^short = "Date and optionally time of authoring/issuing."
  * status ^short = "Status of the resource or document."
     //* insert Full(#SHOULD)
    * ^binding.description = "HL7 Observation Status"
* country 1..1 CodeableConcept "Country visited."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "ISO 3166-1 alpha-2"
  * ^binding.strength = #required
* period 0..1 Period "The period during which the patient visited the country."
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
* header.attestation 0..0
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
