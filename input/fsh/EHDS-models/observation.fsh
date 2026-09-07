Logical: EHDSObservation
Parent: EHDSDataSet
Title: "Observation model"
Description: "EHDSObservation means a structured set of data elements describing a clinical finding or measurement and its results. This includes simple observational findings (e.g., alcohol and tobacco use, blood pressure measurements) and complex medical test results (e.g., cardiopulmonary stress test, Holter monitor), supporting the grouping of related observations and the representation of multi-part results observed under shared or different conditions."

* header
  * status
    * ^binding.description = "HL7 Observation Status"
  * directSubject[x] 0..1 EHDSPatient or EHDSLocation or EHDSDevice or string "The direct subject of the observation if different from the patient (subject of care), e.g. an observation of an implanted device. Additional types of subject may be allowed in implementations."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
* observationDate[x] 1..1 dateTime or Period "Clinically relevant time or time period for the observation."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* type 1..1 CodeableConcept "Observation type that indicates what was observed."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), LOINC, NPU"
  * ^binding.strength = #required
* originalName 0..1 string "Original (conventional) name of the observation as used in the local laboratory or clinical system."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* method 0..1 CodeableConcept "Observation method (measurement principle) to obtain the result."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* specimen 0..1 EHDSSpecimen "Specimen used for this observation."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* order 0..1 EHDSServiceRequest "Identifies order and order placer this observation belongs to."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* performer[x] 0..* EHDSOrganisation or EHDSHealthProfessional or EHDSPatient or EHDSRelatedPerson "Performer of the observation."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* bodySite 0..1 EHDSBodyStructure "Anatomic location and laterality where the observation was performed."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* result 1..1 Base "Result of the observation including text, numeric, coded, and other types of results of the measurement and measurement uncertainty. Content of the observation result will vary according to the type of the observation."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * value[x] 0..1 string or Quantity or Range or Ratio or CodeableConcept "Observation result value according to the type of observation."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "UCUM for units, SNOMED GPS"
    * ^binding.strength = #required
  * uncertainty 0..1 Base "Measurement uncertainty information type and interval if needed about the observation result."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * value 1..1 decimal "The numerical value of the measurement uncertainty."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    * type 0..1 CodeableConcept "Probability Distribution Type for uncertainty"
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "HL7 ProbabilityDistributionType"
      * ^binding.strength = #required
  * dataAbsentReason 0..1 CodeableConcept "Provides a reason why the expected value in the element Observation.result.value[x] is missing."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Data Absent Reason"
    * ^binding.strength = #required
* referenceRange 0..* Base "Reference range, multiple reference ranges of different types could be provided. Provides guide for interpretation of the result."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * low 0..1 Quantity "Low limit of the reference range."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "UCUM for units"
    * ^binding.strength = #required
  * high 0..1 Quantity "High limit of the reference range."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "UCUM for units"
    * ^binding.strength = #required
  * normalValue 0..1 CodeableConcept "Normal value, if relevant for the reference range."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * type 0..1 CodeableConcept "Type of reference range."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Observation Reference Range Meaning Codes"
    * ^binding.strength = #required
  * appliesTo 0..* CodeableConcept "Codes to indicate the target population (e.g., in case of particular sex or race) this reference range applies to."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * age 0..1 Range "Age range to which this reference range applies if applicable."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "UCUM for units"
    * ^binding.strength = #required
  * text 0..1 string "Text based reference range."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
* interpretation 0..* CodeableConcept "Result interpretation, e.g. in comparison with reference ranges."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* note 0..1 string "Free text notes by the health professional."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* component 0..* Base "Component in case the observation consists of multiple sub-observations (e.g. blood pressure)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * type 1..1 CodeableConcept "Type of the component observation"
    * ^binding.description = "SNOMED GPS (preferred), LOINC, NPU"
    * ^binding.strength = #required
  * originalName 0..1 string "Original (user-friendly) name of the observation as used in the local laboratory or clinical system."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * result 1..1 Base "Result of the observation including text, numeric, coded, and other types of results of the measurement and measurement certainty. Content of the observation result will vary according to the type of the observation."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * value[x] 0..1 string or Quantity or Range or Ratio or CodeableConcept "Observation result value according to the type of observation."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM for units, SNOMED GPS"
      * ^binding.strength = #required
    * uncertainty 0..1 Base "Measurement uncertainty information type and interval if needed about the observation result."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * value 1..1 decimal "The numerical value of the measurement uncertainty."
         //* insert Full(#SHOULD)
         //* insert Basic(#SHOULD)
      * type 0..1 CodeableConcept "Probability distribution type for uncertainty"
         //* insert Full(#SHOULD)
         //* insert Basic(#SHOULD)
        * ^binding.description = "HL7 ProbabilityDistributionType"
        * ^binding.strength = #required
    * dataAbsentReason 0..1 CodeableConcept "Provides a reason why the expected value in the element component.result.value[x] is missing."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * ^binding.description = "HL7 Data Absent Reason"
      * ^binding.strength = #required
  * referenceRange 0..* Base "Reference range, multiple reference ranges of different types could be provided. Provides guide for interpretation of the result."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * low 0..1 Quantity "Low limit of the reference range."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM for units"
      * ^binding.strength = #required
    * high 0..1 Quantity "High limit of the reference range."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM for units"
      * ^binding.strength = #required
    * normalValue 0..1 CodeableConcept "Normal value, if relevant for the reference range."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "SNOMED GPS"
      * ^binding.strength = #required
    * type 0..1 CodeableConcept "Type of reference range."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "HL7 Observation Reference Range Meaning Codes"
      * ^binding.strength = #required
    * appliesTo 0..* CodeableConcept "Codes to indicate the target population this reference range applies to."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "SNOMED GPS"
      * ^binding.strength = #required
    * age 0..1 Range "Age range to which this reference range applies if applicable."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM for units"
      * ^binding.strength = #required
    * text 0..1 string "Text based reference range."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
  * interpretation 0..* CodeableConcept "Result interpretation, e.g. in comparison with reference ranges."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
* derivedFrom[x] 0..* EHDSObservation or EHDSLaboratoryObservation or EHDSImagingStudy "Reference to the related resource from which the observation has been made. For example, a calculated anion gap or a fetal measurement based on an ultrasound image."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* hasMember[x] 0..* EHDSLaboratoryObservation or EHDSObservation "Member of the observation group that this observation forms (e.g. in case of a battery, a panel of tests, a set of vital sign measurements)."
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
* header.language
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
