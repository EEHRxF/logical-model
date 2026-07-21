Logical: EHDSMedicationUse
Parent: EHDSDataSet
Title: "Medication use model"
Description: "EHDSMedicationUse means a structured set of data elements describing a use of a single medicinal product as part of a medication summary."

* header
  * patientInsertedData
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * status ^short = "Status of the medicinal product use statement, e.g. 'recorded'."
    * insert Basic(#SHALL)
    * ^binding.description = "HL7 Medication Status Codes"
* medication 1..1 EHDSMedication "Describes the medicinal product."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* reason[x] 0..* CodeableConcept or string "Reason for the use of the medicinal product (typically diagnosis, or a procedure)."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* dosageInstructions 1..1 EHDSDosage "Details of how medicinal product is/was taken or should be taken."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* dateAsserted 0..1 dateTime "Date and optionally time when the medication-use statement was asserted."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* periodOfUse 0..1 Period "Period when the patient took, is taking or is expected to take the medicinal product."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* derivedFrom[x] 0..* EHDSMedicationPrescription or EHDSMedicationDispense or EHDSMedicationAdministration "Prescriptions, dispenses or administrations that are the basis of this medicinal product use statement."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* note 0..1 string "Additional information about the medicinal product use statement"
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.author[x]
  // from EHDSDataSet
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.date
  // from EHDSDataSet
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.identifier
  // from EHDSDataSet
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.language
  // from EHDSDataSet
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* header.status
  // from EHDSDataSet
  * insert Full(#SHALL)
* header.subject
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
// End of obligations propagated from parent models.
