Logical: EHDSHealthProfessional
Title: "Health professional model"
Description: "EHDSHealthProfessional means a structured set of data elements describing a health professional."

* identifier 0..* Identifier "An identifier of the health professional that is unique within a defined scope. Example: national health professional ID. Multiple identifiers may be provided."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* name 0..1 EHDSHumanName "Name of the health professional."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* address 0..* EHDSAddress "Address of the health professional."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* telecom 0..* EHDSTelecom "Telecommunication contact information (address) associated with the health professional, such as phone number, email or messaging service."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* professionalRole 0..* Base "Professional role that the health professional is practising in a given organisation."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * role 0..* CodeableConcept "Health professional role."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS (preferred), ISCO-08"
    * ^binding.strength = #required
  * organisation 0..1 EHDSOrganisation "The organisation where this role is available."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * specialty 0..* CodeableConcept "The speciality of the health professional they are practising in the organisation."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "SNOMED GPS"
    * ^binding.strength = #required
