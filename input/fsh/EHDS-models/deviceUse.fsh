Logical: EHDSDeviceUse
Parent: EHDSDataSet
Title: "Device use model"
Description: "EHDSDeviceUse means a structured set of data elements describing the use of a medical device."

* header
  * patientInsertedData
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * status 1..1
  * status only CodeableConcept
  * status ^short = "Current status of the device usage, e.g. active, completed, etc."
    * ^binding.description = "HL7 Device Use Statement Status"
* periodOfUse 0..1 Period "The period of time during which the device was implanted in the patient or the external device was in use."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* device[x] 1..1 CodeableConcept or EHDSDevice "The details of the device used."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), EMDN"
  * ^binding.strength = #required
* bodySite 0..1 EHDSBodyStructure "Anatomical location of the device. May include laterality."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* reason[x] 0..* CodeableConcept or EHDSCondition or EHDSObservation or EHDSProcedure "Reason or justification for the use of the device."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* note 0..1 string "Free text notes by the health professional."
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
  * insert Basic(#SHOULD)
* header.subject
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
// End of obligations propagated from parent models.
