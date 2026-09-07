Logical: EHDSAdvanceDirective
Parent: EHDSDataSet
Title: "Advance directive model"
Description: "EHDSAdvanceDirective means a documented expression of a patient's wishes, preferences or instructions regarding their healthcare, including, but not limited to, decisions concerning life-sustaining treatment or arrangements to take effect after death."

* header
  * subject
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * identifier
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)

  * author[x]
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
   //* patientInsertedData
     //* insert Basic(#SHOULD)
  * date
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * status
    * ^binding.description = "HL7 Consent State"
* category 0..* CodeableConcept "Categories of directives, such as life support, resuscitation or organ donation."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* directiveType 0..1 CodeableConcept "The type of advance directive, indicating whether it applies before or after death."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* note 0..1 string "Textual description of the directive."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* attachment 0..1 EHDSAttachment "Source document, such as a PDF, with the advance directive and the patient's signature."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.language
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
//* header.patientInsertedData
  // from EHDSDataSet
   //* insert Full(#SHALL)
* header.status
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
// End of obligations propagated from parent models.
