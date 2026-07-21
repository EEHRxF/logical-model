Logical: EHDSPatientInsertedData
// TODO: Derive from EHDSDatSet
Title: "Patient-inserted data model"
Description: "Patient-inserted data model."

* header 1..1 Base "Patient inserted data header."
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
  * subject 1..1 EHDSPatient "Patient/subject information."
    * insert Full(#SHALL)
    * insert Basic(#SHALL)
  * identifier 1..* Identifier "Unique identifier of the document."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * author[x] 1..* EHDSPatient or EHDSRelatedPerson "Author of the document."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * date 1..1 dateTime "Date of finalising/issuing the document."
    * insert Full(#SHALL)
    * insert Basic(#SHALL)
  * status 1..1 CodeableConcept "Status of the document."
    * insert Full(#SHALL)
    * insert Basic(#SHALL)
    * ^binding.description = "HL7 Composition Status"
    * ^binding.strength = #required
  * language 0..1 CodeableConcept "Language in which the document is written. Language is expressed by the IETF language tag."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * ^binding.description = "BCP 47"
    * ^binding.strength = #required
  * documentType 1..1 CodeableConcept "Type of document e.g. 48765-2 Allergies and adverse reactions document."
    * insert Full(#SHALL)
    * insert Basic(#SHALL)
    * ^binding.description = "LOINC"
    * ^binding.strength = #required
  * documentTitle 1..1 string "Human readable document title that can be displayed in search results, etc. This can be documentType's display name or it can contain further information. Example: 'Patient inserted data: allergies and adverse reactions')."
    * insert Full(#SHALL)
    * insert Basic(#SHALL)
  * period 0..1 Period "Time period of information covered in the document."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * version 1..1 string "Version of the document."
    * insert Full(#SHALL)
    * insert Basic(#SHOULD)
  * custodian 0..1 EHDSOrganisation "Organisation that is in charge of maintaining the document."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
  * countryOfOrigin 0..1 CodeableConcept "Country of origin of the document."
    * insert Full(#SHOULD)
    * insert Basic(#SHOULD)
    * ^binding.description = "ISO 3166-1 alpha-2"
    * ^binding.strength = #required
* content[x] 1..* string or EHDSAttachment "Content (payload) of the patient inserted data"
  * insert Full(#SHALL)
  * insert Basic(#SHALL)
