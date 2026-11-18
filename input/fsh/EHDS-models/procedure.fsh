Logical: EHDSProcedure
Parent: EHDSDataSet
Title: "Procedure model"
Description: "EHDSProcedure means a structured set of data elements describing a procedure performed on or for a patient, including surgical, therapeutic, and diagnostic procedures and specimen collection, but excluding procedures in the planning stage."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status ^short = "Status of the procedure, e.g. completed, on hold, stopped."
    * ^binding.description = "HL7 Event Status"
* code 1..1 CodeableConcept "Concept code and display name identifying the type of procedure."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* procedureDate[x] 0..1 dateTime or Period "Date and time of the procedure or interval of its performance."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* performer 0..* EHDSHealthProfessional "Actors who performed the procedure (only main responsible actors required)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* bodySite 0..* EHDSBodyStructure "Target body site of the procedure."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* reason[x] 0..* CodeableConcept or EHDSCondition or EHDSObservation or EHDSProcedure "The reason for performing the procedure.This may be expressed as a coded concept or as a reference to a specific condition, observation or procedure that describes the reason."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* outcome 0..1 CodeableConcept "The immediate result of the procedure (e.g. successful, unsuccessful). This does not include assessment over a longer period of time."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* complication 0..* CodeableConcept "Complication that occurred during the procedure, or in the immediate post-procedure period."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10,"
  * ^binding.strength = #required
* deviceUsed 0..* EHDSDevice "Device used to perform the procedure."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* focalDevice 0..* EHDSDevice "Device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a prosthesis, attaching a wound vac, etc.) as a focal portion of the procedure."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
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
