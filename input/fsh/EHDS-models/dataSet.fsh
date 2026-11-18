Logical: EHDSDataSet
Title: "DataSet model"
Description: "DataSet model."

* header 1..1 Base "Basic metadata for this information."
  //  //* insert Full(#SHALL)
  //  //* insert Basic(#SHALL)
  * subject 1..1 EHDSPatient "Patient/subject information."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * identifier 1..* Identifier "Unique identifier of the resource."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    // TODO Obligation removed to not populate double-obligations downstreams
    * ^comment = "Business identifier is unique within the system that assigns them. The same entity may have different unique identifiers assigned by different systems. Therefore, the identifier is always expected to be a pair of a system and a value."
  // WP resourceCategory is a meta-element represented by each resource's category and its model-specific binding.
  // It is not a separate inherited header element (see EHDSCondition.category and EHDSAdvanceDirective.category).
  // * resourceCategory 0..* CodeableConcept "Data group-specific category (e.g. category of condition, category of advance directive)."
  //   * ^binding.description = "In accordance with the category ‘binding’ in the corresponding data group"
  //   * ^binding.strength = #required
  * clinicalEventTime[x] 0..1 dateTime or Period "Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken)."
  * version 0..1 string "Version of the resource."
  * author[x] 1..* EHDSHealthProfessional or EHDSOrganisation or EHDSDevice /*or EHDSPatient or EHDSRelatedPerson*/ "Information describing who authored the resource."
//     //* insert Full(#SHOULD)
//     //* insert Basic(#SHOULD)
// TODO Obligation removed to not populate double-obligations downstreams
    * ^comment = "Author(s) responsible for the provided information. The exact role of the responsible author varies across use cases and is specific to individual models."
   //* patientInsertedData 0..1 boolean "Indicator that states, when included with value 'true', that the contents of this resource represent information inserted by the natural person or their representative. In this case, the contents shall not be considered as verified by a health professional or a healthcare provider, even if digitally signed by them as part of a bigger data set. Details of the person who inserted the information may be provided in the author[x] element."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHALL)
  * date 0..1 dateTime "Date and optionally time of authoring/issuing."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    // TODO Obligation removed to not populate double-obligations downstreams
  * attestation 0..* Base "Resource attestation details."
    * attester[x] 1..1 EHDSHealthProfessional or EHDSDevice "Attester who validated the resource."
    * dateTime 1..1 dateTime "Date and time of the approval of the resource by the attester."
  * status 1..1 CodeableConcept "Status of the resource."
    //  //* insert Full(#SHALL)
    //  //* insert Basic(#SHOULD)
    * ^binding.description = "Defined in the individual data set"
    * ^binding.strength = #required
  * language 0..* CodeableConcept "Language in which the resource is written. Language is expressed by the IETF language tag."
    //  //* insert Full(#SHOULD)
    //  //* insert Basic(#SHOULD)
    * ^binding.description = "BCP 47"
    * ^binding.strength = #required
  * lastUpdate 0..1 dateTime "Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time."
