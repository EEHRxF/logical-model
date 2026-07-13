Logical: EHDSLaboratoryObservation
Parent: EHDSObservation
Title: "Model for observation performed by laboratory"
Description: "Model for observation performed by laboratory."

* header
  * status
    * insert Basic(#SHALL)
  * directSubject[x] 0..1
  * directSubject[x] only EHDSPatient or EHDSLocation or EHDSDevice or string or EHDSProcedure
  * directSubject[x] ^short = "The direct subject of the observation if different from the patient (subject of care), e.g. an implanted device, a location, or another person."
* type 1..1
* type only CodeableConcept
* type ^short = "Observation type."
* result
  * uncertainty 0..1 Base "Measurement uncertainty information about the observation result."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * value 1..1 decimal "The numerical value of the measurement uncertainty."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
    * type 0..1 CodeableConcept "Probability Distribution Type for uncertainty"
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
      * ^binding.description = "HL7 Probability Distribution Type"
      * ^binding.strength = #required
  * dataAbsentReason 0..1
  * dataAbsentReason only CodeableConcept
  * dataAbsentReason ^short = "Provides a reason why the expected value in the element LaboratoryObservation.result.value[x] is missing."
    * insert Full(#SHALL)
* referenceRange
  * appliesTo 0..*
  * appliesTo only CodeableConcept
  * appliesTo ^short = "Codes to indicate the target population this reference range applies to."
* component
  * code 1..1
  * code only CodeableConcept
  * code ^short = "Type of the component observation."
    * insert Full(#SHALL)
    * insert Basic(#SHOULD)
  * result 1..1
  * result only Base
  * result ^short = "Result of the observation including text, numeric, coded, and other types of results of the measurement and measurement uncertainty. Content of the observation result will vary according to the type of the observation."
    * value[x]
      * ^binding.description = "UCUM for units"
    * uncertainty 0..1 Base "Measurement uncertainty information about the observation result."
      * insert Full(#SHOULD)
      * insert Basic(#SHOULD)
      * value 1..1 decimal "The numerical value of the measurement uncertainty."
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
      * type 0..1 CodeableConcept "Probability Distribution Type for uncertainty"
        * insert Full(#SHOULD)
        * insert Basic(#SHOULD)
        * ^binding.description = "HL7 Probability Distribution Type"
        * ^binding.strength = #required
  * referenceRange
    * insert Full(#SHALL)
    * low
      * insert Full(#SHALL)
    * high
      * insert Full(#SHALL)
    * type
      * insert Full(#SHALL)
    * appliesTo
      * insert Full(#SHALL)
    * age
      * insert Full(#SHALL)
  * interpretation
    * insert Full(#SHALL)
* triggeredBy[x] 0..* EHDSLaboratoryObservation or EHDSObservation "References to the observation that triggered the performance of this observation."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* testKit 0..1 EHDSDevice "Laboratory test kit used during measurement."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* calibrator 0..1 Identifier "Information about which end-user calibrator the laboratory used for the measurement to indicate the metrological traceability chain."
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* accreditationStatus 0..1 boolean "Accreditation status of the laboratory for the observation."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* previousResults 0..* EHDSLaboratoryObservation "Previous results of the same observation"
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* pointOfCareTest 0..1 boolean "Examination performed near or at the site of a patient."
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)

// Elements inherited from the parent model but not present in the source table.
* result.certainty 0..0
* component.result.certainty 0..0

// Obligations propagated from parent models.
/* * bodySite
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* component
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* component.interpretation
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.originalName
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* component.referenceRange
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.referenceRange.age
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.referenceRange.appliesTo
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.referenceRange.high
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.referenceRange.low
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.referenceRange.normalValue
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* component.referenceRange.text
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* component.referenceRange.type
  // from EHDSObservation
  * insert Basic(#SHOULD)
* component.result
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* component.result.dataAbsentReason
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* component.result.value[x]
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* derivedFrom[x]
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* hasMember[x]
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
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
* header.directSubject[x]
  // from EHDSObservation
  //* insert Full(#SHALL)
  //* insert Basic(#SHOULD)
* header.identifier
  // from EHDSDataSet
  //* insert Full(#SHOULD)
  //* insert Basic(#SHOULD)
* header.language
  // from EHDSDataSet
  //* insert Full(#SHOULD)
  //* insert Basic(#SHOULD)
* header.patientInsertedData
  // from EHDSDataSet
  //* insert Full(#SHALL)
  //* insert Basic(#SHALL)
* header.status
  // from EHDSDataSet
  //* insert Full(#SHALL)
* header.subject
  // from EHDSDataSet
  //* insert Full(#SHALL)
  //* insert Basic(#SHALL)
* interpretation
  // from EHDSObservation
  //* insert Full(#SHOULD)
  //* insert Basic(#SHOULD)
* method
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* note
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* observationDate[x]
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* order
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* originalName
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* performer[x]
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.age
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.appliesTo
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.high
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.low
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.normalValue
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.text
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* referenceRange.type
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* result
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* result.dataAbsentReason
  // from EHDSObservation
  * insert Basic(#SHOULD)
* result.value[x]
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
* specimen
  // from EHDSObservation
  * insert Full(#SHOULD)
  * insert Basic(#SHOULD)
* type
  // from EHDSObservation
  * insert Full(#SHALL)
  * insert Basic(#SHOULD)
// End of obligations propagated from parent models.
 */