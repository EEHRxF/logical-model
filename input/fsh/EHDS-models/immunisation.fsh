Logical: EHDSImmunisation
Parent: EHDSDataSet
Title: "Immunisation model"
Description: "EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning."

* header
  * patientInsertedData
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * status ^short = "Status of the immunisation event, e.g., completed, not-done."
    * ^binding.description = "HL7 Immunization Status Codes"
* diseaseOrAgentTargeted 0..* CodeableConcept "Disease or agent that the vaccination provides protection against."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10"
  * ^binding.strength = #required
* vaccine 1..1 CodeableConcept "Type of immunisation."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
  * ^binding.description = "ATC (preferred), SNOMED GPS"
  * ^binding.strength = #required
* administeredProduct 0..1 EHDSMedication "Administered medicinal product, including batch/lot details when necessary."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* administrationTime 1..1 dateTime "The date and optionally the exact time when the vaccination was administered."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* administeringCentre 0..1 EHDSOrganisation "Administering centre or a health authority responsible for the vaccination event."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* administrator 0..1 EHDSHealthProfessional "Health professional responsible for administering the immunisation product."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
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
