Logical: EHDSCondition
Parent: EHDSDataSet
Title: "Condition model"
Description: "EHDSCondition means a structured set of data elements describing a clinical condition, problem, or diagnosis."

* header
  * status ^short = "Status of the condition/problem, e.g. active, resolved, inactive."
    * ^binding.description = "HL7 Condition Clinical Status Codes"
* code 1..1 CodeableConcept "Code identifying the condition, problem or diagnosis."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, ICD-O, Orphacode"
  * ^binding.strength = #required
* onsetDate 0..1 dateTime "Estimated or actual date the problem/condition began."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* endDate 0..1 dateTime "The date or estimated date that the condition resolved or went into remission."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* category 0..* CodeableConcept "Category of the problem (e.g. POA – present on admission, hospital-acquired condition (HAC) and other categorisations)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* resolutionCircumstances 0..1 string "Describes the reason for which the status of the problem changed from current to inactive (e.g. surgical procedure, medical treatment)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* severity 0..1 CodeableConcept "A subjective assessment of the severity of the condition."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* bodySite 0..* EHDSBodyStructure "The anatomical location including laterality where this condition manifests itself."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* stage 0..* CodeableConcept "Stage or grade, usually assessed formally using a specific staging, grading or classification system, such as Tumor, Node, Metastasis (TNM), International Classification of Diseases for Oncology (ICD-O) or Breast Imaging Reporting and Data Systems (BI-RADS). Multiple assessment systems may be used."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "Not defined"
  * ^binding.strength = #required
* diagnosisAssertionStatus 0..1 CodeableConcept "Assertion about the certainty associated with a diagnosis. Evidence of condition (diagnostic, clinical or both)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Condition Verification Status"
  * ^binding.strength = #required
* specialistContact 0..* EHDSHealthProfessional "Health professional who may be specifically related to the problem, as a preferred contact."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* externalResource 0..* uri "External resource which may be specifically related to the problem, for example a link to a guideline on a specific rare disease problem."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* note 0..1 string "Free text note by the health professional."
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
//* header.patientInsertedData
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
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
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
* header.version 0..0
// * header.attestation 0..0 // Parent element removed from EHDSDataSet.
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
