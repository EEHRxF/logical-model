Logical: EHDSMedicationAdministration
Parent: EHDSDataSet
Title: "Medication administration model"
Description: "EHDSMedicationAdministration means a structured set of data elements describing a single instance of the administration of a medicinal product in the context of an imaging or laboratory procedure."

* header
  * identifier only Identifier
  * identifier ^short = "Business identifier for the object, unique within its system."
  * author[x] only EHDSHealthProfessional or EHDSOrganisation or EHDSDevice
  * date 0..1
  * date only dateTime
  * date ^short = "Date and optionally time of authoring/issuing."
  * status
    * ^binding.description = "HL7 Medication Administration Status Codes"
* medication 1..1 EHDSMedication "Administered medicinal product."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* occurrence[x] 1..1 dateTime or Period "Specific date/time or interval of time during which the administration took place (or did not take place)."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* reason[x] 0..* CodeableConcept or EHDSCondition or EHDSObservation "Condition or observation that supports why the medicinal product was administered."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS (preferred), ICD-10, Orphacode"
  * ^binding.strength = #required
* dosage 0..1 EHDSAdministeredDosage "Details of how medicinal product was taken/administered."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* note 0..1 string "Textual information about the administration."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)

// Elements inherited from the parent model but not present in the source table.
//* header.patientInsertedData 0..0

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
* header.author[x] ^short = "Author of the resource."

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
* header.version 0..0
// * header.attestation 0..0 // Parent element removed from EHDSDataSet.
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
