Logical: EHDSMedicationPrescription
Parent: EHDSDataSet
Title: "Electronic prescription model"
Description: "Electronic prescription."

* header ^short = "Prescription header."
  * subject 1..1
  * subject only EHDSPatient
  * subject ^short = "The person for whom a medicinal product is prescribed/ordered."
  * identifier 1..*
  * identifier only Identifier
  * identifier ^short = "Business identifier(s) for the prescription."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * author[x] 1..*
  * author[x] only EHDSHealthProfessional //"Author of the document."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * date 1..1
  * date only dateTime
  * date ^short = "Date and time of issuance (signature) of the prescription by prescriber."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * status ^short = "Status of authorisation for dispensing the prescription items. For a multiple-item prescription, this conveys the aggregate status of the entire prescription. In the case of a single-item prescription, prescriptionItem.status shall be the same as header.status."
     //* insert Basic(#SHALL)
    * ^binding.description = "HL7 Medication Request Status"
  * statusReason[x] 0..1 CodeableConcept or string "Reason for the current status of prescription, for example the reason why the prescription was cancelled or changed from a previous state."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * ^binding.description = "Not defined" //"HL7 Medication Request Status Reason"
    * ^binding.strength = #required
* presentedForm 0..* EHDSAttachment "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* prescriptionItem 1..* Base "Prescription line for one medicinal product. If multiple medicinal products are prescribed, all items need to be authored together."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * identifier 1..* Identifier "Identifier for a single item on the prescription. This identifier may be linked to the prescription identifier. In the case of a multiple-line prescription, this identifier may be constructed, for example, as the prescription identifier combined with the line number."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * status 1..1 CodeableConcept "Status of a single item on prescription. In the case of a single-item prescription, the status of the prescription has the same meaning as the status of the item."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * ^binding.description = "HL7 Medication Request Status"
    * ^binding.strength = #required
  * statusReason[x] 0..1 CodeableConcept or string "Reason for the current status of prescription item, for example the reason why the prescription was cancelled or why the prescription was changed from the previous status."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * ^binding.description = "Not defined" //"HL7 Medication Request Status Reason"
    * ^binding.strength = #required
  * medication 1..1 EHDSMedication "Prescribed medicinal product."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * indication[x] 0..* CodeableConcept or string "Reason for the prescription (typically diagnosis, or a procedure)."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
    * ^binding.strength = #required
  * intendedUseType 0..1 CodeableConcept "Intent of the prescription – prophylaxis, treatment, anaesthesia, etc."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
  * periodOfUse 0..1 Period "Period over which the medicinal product is to be taken (in the case of multiple dosage schemes, this shall be the overall period of all dosages)."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * quantityPrescribed 1..1 Quantity "Overall quantity of medicinal product prescribed in this prescription item (e.g. number of packages or number of tablets). Where the total quantity cannot be determined unambiguously at issuance, the prescriber may express it on the basis of dosage instructions, validity period and number of repeats."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "UCUM for units of measurement, EDQM Standard Terms for units of presentation"
    * ^binding.strength = #required
  * dosageInstructions 0..1 EHDSDosage "Dosage and administration instructions."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * validityPeriod 0..1 Period "The period over which the prescription is considered valid and dispensable. validityPeriod.start is, if missing, assumed to be the date of issuance of the prescription."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * substitution 0..1 Base "Whether and, if so, which type of substitution is allowed, as indicated by the prescriber, for this prescription. The legislation in the country of dispensation applies for performing a substitution."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * allowed[x] 0..1 boolean or CodeableConcept "Whether and, if so, to what extent substitution is allowed."
       //* insert Full(#SHALL)
       //* insert Basic(#SHALL)
      * ^binding.description = "HL7 Substance Admin Substitution"
      * ^binding.strength = #required
    * reason[x] 0..1 CodeableConcept or string "Reason for the substitution requirement (e.g. Biological product, Patient allergic to an excipient in alternative products)."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * ^binding.description = "SNOMED GPS"
      * ^binding.strength = #required
  * numberOfRepeats 0..1 integer "Number of refills authorised – how many times the prescription item may be dispensed in addition to the original dispensation. If the element is missing, no repeats are authorised."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * minimumDispenseInterval 0..1 Quantity "Minimum dispensation interval. If a prescription allows for repeated dispensations, the interval between dispensations shall be stated here."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * offLabel 0..1 Base "Indicates that the medicinal product is knowingly prescribed for use for an age group, dosage or route of administration not included in the authorised product information."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * isOffLabelUse 1..1 boolean "Indicates whether the medicinal product is prescribed outside the terms of its marketing authorisation. The value shall be ‘true’ if the medicinal product is prescribed for off-label use and ‘false’ otherwise. Where a reason for off-label use is provided, the value shall be ‘true’."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * reason[x] 0..1 string or CodeableConcept "Reason or related clarification for off-label use."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * ^binding.description = "Not defined"
      * ^binding.strength = #required
  * note 0..1 string "Additional information or comments, e.g. message to the dispenser."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)

// Elements inherited from the parent model but not present in the source table.
//* header.author[x] 0..0
//* header.patientInsertedData 0..0

// Obligations propagated from parent models.
* header
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
// End of obligations propagated from parent models.

// Element descriptions aligned with WP v5.
* header.author[x] ^short = "Author of the document."
* header.language ^short = "Language in which the document is written. Language is expressed by the IETF language tag."

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
* header.clinicalEventTime[x] 0..0
* header.version 0..0
* header.attestation 0..0
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
