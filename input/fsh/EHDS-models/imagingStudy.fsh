Logical: EHDSImagingStudy
Parent: EHDSDataSet
Title: "Imaging study model."
Description: "EHDSImagingStudy means the structured set of data elements for facilitating the exchange of imaging studies. Its goal is to enable the exchange of imaging studies regardless of whether the corresponding imaging report is available. It contains metadata that includes the endpoint where the imaging study is located. EHDSImagingStudy may be represented using DICOM KOS and/or HL7 FHIR, depending on the implementation guide."

* header
  * identifier 1..*
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * author[x] 1..*
  * author[x] only EHDSHealthProfessional or EHDSOrganisation or EHDSDevice
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * date 1..1
  * date ^short = "Date and optionally time when the imaging study representation or manifest was authored or issued, distinct from the date and time when the imaging study started."
     //* insert Full(#SHALL)
  * status
    * ^short = "Status of the resource. Where the source representation does not provide a reliable life cycle status, ‘unknown’ may be used. Status available shall be used only where availability has been established."
    * ^binding.description = "HL7 Imaging Study Status"
* presentedForm 0..* EHDSAttachment "PDF version of the imaging study to be used where DICOM version is not available. This is a fallback option and is not intended to replace the exchange of DICOM imaging studies."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* modality 0..* CodeableConcept "All of the distinct values for series’ modalities."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "DICOM CID 33 Modality"
  * ^binding.strength = #required
* bodySite 0..* EHDSBodyStructure "All of the distinct values for series’ examined body parts."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* encounter 0..1 EHDSEncounter "Reference to the encounter with which this imaging study is associated."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* started 0..1 dateTime "Date and time the study started."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* basedOn 0..* EHDSServiceRequest "Reference to the diagnostic request that resulted in this imaging study being performed."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* numberOfSeries 0..1 integer "Number of series in the study."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* numberOfInstances 0..1 integer "Number of SOP instances in the study. This value given may be larger than the number of instance elements this resource contains due to resource availability, security or other factors. This element shall be present if at least one instance element is present."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* description 0..1 string "The imaging manager description of the study. Institution-generated description or classification of the study (component) performed."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* custodian 0..1 EHDSOrganisation "Organisation name, address, contact information."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* endpoint 0..* EHDSEndpoint "Study endpoint describing the technical details of a location that may be connected to for the retrieval of the imaging study or display of the study in a remote viewer. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* series 1..* Base "Series. Each study has one or more series of instances."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * seriesUid 1..1 Identifier "DICOM Series Instance Unique Identifier (UID) for the series."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * number 0..1 integer "Numeric identifier of this series."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * seriesModality 1..1 CodeableConcept "Acquisition modality used for this series."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * ^binding.description = "DICOM CID 29 Acquisition Modality"
    * ^binding.strength = #required
  * description 0..1 string "A short human-readable summary of the series."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * numberOfInstances 0..1 integer "Number of series-related instances."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * seriesEndpoint 1..* EHDSEndpoint "Series endpoint describing the technical details of a location that may be connected to for the retrieval of the series. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services."
  //"Series endpoint describing the technical details of a location that can be connected to for the delivery/retrieval of information. Sufficient information is required to ensure that a connection can be made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services, or national service."
     //* insert Full(#SHALL)
     //* insert Basic(#SHALL)
  * bodySite 0..1 EHDSBodyStructure "Body part examined."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * specimen 0..* EHDSSpecimen "Specimen imaged."
  * started 0..1 dateTime "Date and time when the series started."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
  * instanceInTheSeries 0..* Base "Instance that is part of the series."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * instanceTitle 0..1 string "Instance title that is the description of the instance."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * instanceUid 1..1 Identifier "DICOM SOP Instance UID."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * sopClass 1..1 uri "SOP class – DICOM class type."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * instanceNumber 0..1 integer "The number of this instance in the series."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * numberOfFrames 0..1 integer "The number of frames in a multiframe instance."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    * keyImage 0..* Base "List of key image flags with a reason why this image is selected as a key image, and reference to the Key Image Note that flags the image as significant."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * flag 1..1 CodeableConcept "Reason for flagging the image as significant."
         //* insert Full(#SHOULD)
         //* insert Basic(#SHOULD)
        * ^binding.description = "DICOM PS3.16 CID 7010"
        * ^binding.strength = #required
      * reason 0..1 string "Textual reason for flagging the image as significant."
         //* insert Full(#SHOULD)
         //* insert Basic(#SHOULD)
      // Aurora 21, revised in commit 96fb0898: identifiers are provided by the containing series and instance.
      // References flagged by a DICOM KOS document are obtained by retrieving and inspecting that document.
      // * seriesUID 1..* Identifier "Series instance UID for the series that contains the instances flagged as significant."
      //    //* insert Full(#SHALL)
      //    //* insert Basic(#SHALL)
      // * instanceUID 1..* Identifier "SOP Instance UID for the instances flagged as significant by the Key Image Note object (DICOM KOS) that flags this image."
      //    //* insert Full(#SHALL)
      //    //* insert Basic(#SHALL)

// Elements inherited from the parent model but not present in the source table.
//* header.patientInsertedData 0..0

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.date
  // from EHDSDataSet
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
* header.identifier ^short = "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
* header.author[x] ^short = "Author of the resource."

// Aurora 45, commit 96fb0898: search metadata is not inherited into individual data-group content.
// * header.clinicalEventTime[x] 0..0 // Parent element removed from EHDSDataSet.
* header.version 0..0
* header.attestation 0..0
// * header.lastUpdate 0..0 // Obsolete: the parent definition is commented out by user decision.
