Logical: EHDSRelatedPerson
Title: "Related person model"
Description: "EHDSRelatedPerson means a structured set of data elements describing a person related to the patient, such as a guardian, next of kin, or other related person."

* identifier 0..* Identifier "A stable identifier of the related person that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * type 1..1 CodeableConcept "Description of identifier consisting of HL7 identifier type extended with: NI (national unique identifier); HI (health identifier); HIN (health insurance number); SS (social security identifier); REGPID (regional person identifier); REGION (region identifier)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "HL7 Identifier Type with an appropriate extension"
    * ^binding.strength = #required
  * value 1..1 string "The value that is unique."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * system 1..1 uri "The namespace for the Identifier value."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
* name 1..* EHDSHumanName "Name associated with the person."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* subject 1..1 EHDSPatient "The patient in relation to whom the related person is defined."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* relationship 0..1 CodeableConcept "Relationship between a patient and a contact person for that patient (e.g. relative, guardian or caring person)."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Patient Relationship Type"
  * ^binding.strength = #required
* address 0..* EHDSAddress "Address of the person."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* telecom 0..* EHDSTelecom "Telecommunication contact information of the person."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
