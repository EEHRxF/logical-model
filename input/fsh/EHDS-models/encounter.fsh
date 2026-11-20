Logical: EHDSEncounter
Parent: EHDSDataSet
Title: "Encounter model"
Description: "EHDSEncounter means a structured set of data elements describing a patient's interaction with a healthcare service, but excluding the tracking of broader episodes of care (e.g., a maternity episode from first antenatal visit through delivery and postnatal follow-up) extending beyond individual encounters."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status ^short = "Status of the encounter (e.g. discharged, discontinued, completed)."
    * ^binding.description = "HL7 Encounter Status"
* priority 0..1 CodeableConcept "Indicates the urgency of the encounter (e.g. urgent, routine)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Act Priority"
  * ^binding.strength = #required
* class 1..1 CodeableConcept "Class of the encounter (inpatient, ambulatory, virtual)."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Act Encounter Code"
  * ^binding.strength = #required
* period 1..1 Period "The actual start and end time of the encounter."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* serviceProvider 0..1 EHDSOrganisation "The organisation (facility) responsible for this encounter."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* referringProfessional 0..1 EHDSHealthProfessional "Referring healthcare professional."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* basedOn[x] 0..* EHDSCarePlan or EHDSServiceRequest "Reference to the request that initiated this encounter."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* reason[x] 0..* CodeableConcept or EHDSCondition or EHDSProcedure or EHDSObservation or string "Reason for admission, e.g. problem, procedure or finding."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* admission 0..1 Base "Details about the admission to a healthcare service."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * admitter 0..1 EHDSHealthProfessional "Admitting healthcare professional."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * admitSource 0..1 CodeableConcept "The type of admission indicating where the patient came in (e.g. born in hospital, from nursing home, physician referral, transferred from another hospital)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Admit Source"
    * ^binding.strength = #required
* dischargeDiagnosis[x] 0..* CodeableConcept or EHDSCondition "The diagnoses at the time of discharge."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* dischargeDestination 0..1 Base "Location or organisation to which the patient is going after discharge."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * type 0..1 CodeableConcept "Type of location (e.g. home, hospital, nursing home)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Discharge Disposition"
    * ^binding.strength = #required
  * location[x] 0..1 EHDSOrganisation or string "The location or organisation (including contact details)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
* serviceLocation 0..* Base "List of locations where the patient was present during this encounter."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * period 0..1 Period "Time period during which the patient was present at the organisation."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * organisation 1..1 EHDSOrganisation "Organisation or part of an organisation (e.g. department) where the patient was present during the encounter."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* subEncounter 0..* EHDSEncounter "Reference to encounters that are considered parts of this encounter."
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

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
* header.clinicalEventTime[x] 0..0
* header.version 0..0
* header.attestation 0..0
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
