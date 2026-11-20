Logical: EHDSCarePlan
Parent: EHDSDataSet
Title: "Care plan model"
Description: "EHDSCarePlan means a structured set of data elements describing the intended management of a patient's health conditions but excluding pharmacological treatment plans that are represented through medication model."

* header
  * identifier
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^short = "Identifier for the care plan."
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status // TODO: inherited with obligations from EHDSDataSet, will be re-introduced in the next version.
    * ^definition = "Indicates whether the plan is currently being acted upon, represents future intentions or is now a historical record."
    * ^binding.description = "HL7 Request Status"
    * ^binding.strength = #required

* title 0..1 string "Human-friendly name for the care plan."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* description 0..1 string "A description of the scope and nature of the plan."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* period 0..1 Period "Indicates when the plan did (or is intended to) come into effect and end."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* conditionAddressed[x] 0..* CodeableConcept or EHDSCondition "Conditions, problems, concerns, diagnoses, etc. whose management, mitigation or management and mitigation are handled by this plan."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* activity[x] 0..* CodeableConcept or string "The details of the proposed activity represented in a specific resource."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  // * activityCodeableConcept 0..1 CodeableConcept "A code that identifies the activity type."
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
  // * activityReferenceString 0..1 string "A text that identifies the activity type."
* goal[x] 0..* CodeableConcept or string "Describes the intended objective of carrying out the care plan."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  // * goalCodeableConcept 0..1 CodeableConcept "A code describing the goal."
  * ^binding.description = "Not defined"
  * ^binding.strength = #required
  // * goalString 0..1 string "A text describing the goal."

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
* header.author[x] ^short = "Author of the resource."

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
* header.version 0..0
* header.attestation 0..0
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
