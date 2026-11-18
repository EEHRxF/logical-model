Logical: EHDSServiceRequest
Parent: EHDSDataSet
Title: "Service request model"
Description: "EHDSServiceRequest means a structured set of data elements describing one or more requested services."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status
    * ^binding.description = "HL7 Request status"
* description 0..1 string "Textual description of the requested service"
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* code 0..1 CodeableConcept "A code and name that identifies a particular service (i.e. procedure, diagnostic investigation, or panel of investigations) that has been requested."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), LOINC, NPU"
  * ^binding.strength = #required
* quantity 0..1 Quantity "Number of requested services of the same type."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "UCUM"
  * ^binding.strength = #required
* bodySite 0..* EHDSBodyStructure "Anatomic location and laterality where the procedure shall be performed. This is the target site."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* reason[x] 0..* EHDSObservation or EHDSCondition or EHDSMedication or string "Reason why this service is being requested."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* priority 0..1 CodeableConcept "Indicates how quickly the request shall be addressed with respect to other requests."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Request Priority"
  * ^binding.strength = #required
* supportingInformation[x] 0..* EHDSObservation or EHDSCondition or EHDSProcedure or EHDSMedicationAdministration "Health conditions relevant for the results interpretation."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* specimen 0..* EHDSSpecimen "Specimen to be used by the laboratory procedure."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* encounter 0..1 EHDSEncounter "The encounter that provides additional information about the healthcare context in which this request is made."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* occurrence[x] 0..1 dateTime or Period "Required time of the service."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* patientInstructions 0..1 string "Patient- or consumer-oriented instructions."
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
