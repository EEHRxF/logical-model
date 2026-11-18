Logical: EHDSEndpoint
Title: "Endpoint model"
Description: "EHDSEndpoint means a structured set of data elements describing the technical details of a connection point for electronic services."

* identifier 1..* Identifier "Identifier for the endpoint."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* status 1..1 CodeableConcept "Status of the endpoint, e.g. active, limited."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * ^binding.description = "HL7 Endpoint Status"
  * ^binding.strength = #required
* connectionType 1..* CodeableConcept "A coded value identifying the technical protocol, profile or standard used to connect to and communicate with the endpoint."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
  * ^binding.description = "HL7 Endpoint Connection Type"
  * ^binding.strength = #required
* name 0..1 string "A friendly name that this endpoint may be referred to with."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* managingOrganisation 0..1 EHDSOrganisation "The organisation that provides technical management services for this endpoint."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* payload 0..* Base "The set of payloads that are provided/available at this endpoint."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * mimeType 0..* CodeableConcept "The MIME type to send the payload in (e.g. application/fhir+xml, application/fhir+json)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "BCP 13"
    * ^binding.strength = #required
  * profileCanonical 0..* uri "The technical profile that is required at this endpoint. It describes the resources that are handled, or even simply which resource types."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * profileUri 0..* uri "The profile (as a uniform resource identifier (URI)) that is required at this endpoint when not represented using an FHIR profile."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
* address 1..1 uri "The URI that describes the actual endpoint to connect to."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header 0..* string "Additional headers/information to send as part of the notification. Usage depends on the channel type."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
