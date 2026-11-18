Logical: EHDSPatient
Title: "Patient model"
Description: "EHDSPatient means a structured set of data elements describing a subject of care."

* identifier 1..* Identifier "A stable identifier of the patient that is unique within a defined scope. In addition to the mandatory attributes listed below, other attributes compliant with the HL7 FHIR Identifier structure may be included."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * type 1..1 CodeableConcept "Description of identifier consisting of HL7 identifier type extended with: NI (national unique identifier); HI (health identifier); HIN (health insurance number); SS (social security identifier); REGPID (regional person identifier); REGION (region identifier)."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
    * ^binding.description = "HL7 Identifier Type with an appropriate extension"
    * ^binding.strength = #required
  * value 1..1 string "The value that is unique."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * system 1..1 uri "The namespace for the Identifier value."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
* name 1..* EHDSHumanName "Name associated with the patient."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* dateOfBirth 0..1 dateTime "Date of birth."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* deceased[x] 0..1 boolean or dateTime "Indicator stating whether the patient is deceased or date and optionally time of death."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* administrativeGender 1..1 CodeableConcept "The gender that the patient is considered to have for administration and record-keeping purposes."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * ^binding.description = "HL7 Administrative Gender"
  * ^binding.strength = #required
* genderIdentity 0..1 CodeableConcept "The gender identity as declared by the patient."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "Not defined"
  * ^binding.strength = #required
* sexForClinicalUse 0..1 CodeableConcept "A summary parameter that provides guidance on how a receiver shall apply settings or reference ranges that are derived from observable information such as an organ inventory, recent hormone lab tests, genetic testing, menstrual status, obstetric history, etc."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Sex Parameter For Clinical Use"
  * ^binding.strength = #required
* address 0..* EHDSAddress "Address of the patient."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* telecom 0..* EHDSTelecom "Contact information."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
