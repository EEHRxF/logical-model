Logical: EHDSAllergyIntolerance
Parent: EHDSDataSet
Title: "Allergy intolerance model"
Description: "EHDSAllergyIntolerance means a structured set of data elements describing a clinically identified predisposition of a patient to an adverse reaction upon exposure to a specific agent or allergen."

* header
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status ^short = "Current status of the allergy or intolerance, for example whether it is active, inactive or resolved."
    * ^binding.description = "HL7 AllergyIntolerance Clinical Status Codes"
    * ^binding.strength = #required
* type 0..1 CodeableConcept "Type of propensity (indicating allergy or intolerance). The type element may be omitted from the resource when there is insufficient information to classify the reaction as either an allergy or an intolerance."
  * ^binding.description = "HL7 AllergyIntoleranceType"
  * ^binding.strength = #required
* agentOrAllergen 1..1 CodeableConcept "Code that identifies the substance, pharmaceutical product or group of medications the person is allergic or intolerant to."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)"
  * ^binding.strength = #required
  * ^comment = "Code for an allergy or intolerance statement (either a positive or a negated/excluded statement). This may be a code for a substance or pharmaceutical product that is considered to be responsible for the adverse reaction risk (e.g., Latex), an allergy or intolerance condition (e.g., Latex allergy), or a negated/excluded code for a specific substance or class (e.g., No latex allergy). It must be clinically safe to only process the 'code' and ignore the 'reaction.substance'."
* note 0..1 string "Free text notes by the health professional."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* criticality 0..1 CodeableConcept "Estimate of the potential clinical harm, or seriousness, of a reaction to an identified substance."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Allergy Intolerance Criticality"
  * ^binding.strength = #required
* certainty 0..1 CodeableConcept "Assertion about the certainty associated with a propensity, or potential risk, of a reaction to the identified substance. Evidence of condition (diagnostic, clinical or both)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Allergy Intolerance Verification Status Codes"
  * ^binding.strength = #required
* onsetDate 0..1 dateTime "When allergy or intolerance was identified."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* endDate 0..1 dateTime "Date of resolution of the allergy or intolerance (e.g. when the clinician deemed that there is no longer any need to track the underlying condition)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* reaction 0..* Base "Adverse reaction events linked to exposure to substance."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * substance 0..1 CodeableConcept "Specific substance or pharmaceutical product considered responsible for the reaction episode in which the allergy or intolerance was detected."
    * ^binding.description = "EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)"
    * ^binding.strength = #required
  * manifestation 0..* CodeableConcept "Description of the clinical manifestation of the allergic reaction."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * severity 0..1 CodeableConcept "Severity of the clinical manifestation of the allergic reaction."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 AllergyIntolerance Severity"
    * ^binding.strength = #required
  * onset 0..1 dateTime "Date and time of the onset of the reaction."
     //* insert Full(#SHALL)
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
