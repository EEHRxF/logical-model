Logical: EHDSMedicationDispense
Parent: EHDSDataSet
Title: "Medication dispense model"
Description: "Medication dispense model."

* header 1..1
* header only Base
* header ^short = "Dispensation header."
  * identifier 1..*
  * identifier only Identifier
  * identifier ^short = "Business identifier for the dispensation."
  * author[x] 1..*
  * author[x] only EHDSHealthProfessional or EHDSOrganisation or EHDSDevice
  * author[x] ^short = "Author of the document."
    * insert Full(#SHALL)
  * date 1..1
  * date only dateTime
  * date ^short = "Date and time of issuing the dispense record."
    * insert Full(#SHALL)
  * status 1..1
  * status only CodeableConcept
  * status ^short = "The status of the dispense, e.g. completed, declined, entered-in-error."
    * insert Basic(#SHALL)
    * ^binding.description = "HL7 Medication Dispense Status Codes"
  * language 0..1
  * language only CodeableConcept
  * language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."
* dispenseLocation 0..1 EHDSOrganisation "Location of dispense."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* receiver[x] 0..1 EHDSPatient or EHDSHealthProfessional or EHDSRelatedPerson "Identification of the person who received the dispensed medicinal products, especially when it was not the patient. When not present, it is assumed that the patient is the receiver."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* relatedRequest 1..* Identifier "Identifier of the prescription item the dispense is related to."
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* medication 1..1 EHDSMedication "Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispense records should be created."
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* dispensedQuantity 1..1 Quantity "Number of dispensed packages if the package size is known, or number of smaller items/units, according to the medicinal product dispensed. A unit shall be provided."
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
  * ^binding.description = "UCUM (preferred), EDQM Standard Terms"
  * ^binding.strength = #required
* substitutionOccurred 0..1 boolean "Whether substitution was made by the dispenser. Definition of substitution is specific to the jurisdiction."
* dosageInstructions 0..1 EHDSDosage "Dosage and administration instructions for the dispensed medicinal product. These instructions may deviate from the instructions included in the prescription."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* note 0..1 string "Additional information or comments."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)

// Elements inherited from the parent model but not present in the source table.
* header.patientInsertedData 0..0

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
* header.author[x]
  // from EHDSDataSet
  * insert Basic(#SHOULD)
* header.date
  // from EHDSDataSet
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
