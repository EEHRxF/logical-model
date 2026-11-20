# Imaging study model. - EHDS Logical Information Models v0.3.0

## Logical Model: Imaging study model. 

**Usages:**

* Use this Logical Model: [Imaging report model.](StructureDefinition-EHDSImagingReport.md) and [Observation model](StructureDefinition-EHDSObservation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSImagingStudy.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSImagingStudy.csv), [Excel](../StructureDefinition-EHDSImagingStudy.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSImagingStudy",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingStudy",
  "version" : "0.3.0",
  "name" : "EHDSImagingStudy",
  "title" : "Imaging study model.",
  "status" : "draft",
  "date" : "2026-11-20T11:33:53+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSImagingStudy means the structured set of data elements for facilitating the exchange of imaging studies. Its goal is to enable the exchange of imaging studies regardless of whether the corresponding imaging report is available. It contains metadata that includes the endpoint where the imaging study is located. EHDSImagingStudy may be represented using DICOM KOS and/or HL7 FHIR, depending on the implementation guide.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImagingStudy",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSImagingStudy",
      "path" : "EHDSImagingStudy",
      "short" : "Imaging study model.",
      "definition" : "EHDSImagingStudy means the structured set of data elements for facilitating the exchange of imaging studies. Its goal is to enable the exchange of imaging studies regardless of whether the corresponding imaging report is available. It contains metadata that includes the endpoint where the imaging study is located. EHDSImagingStudy may be represented using DICOM KOS and/or HL7 FHIR, depending on the implementation guide."
    },
    {
      "id" : "EHDSImagingStudy.header.identifier",
      "path" : "EHDSImagingStudy.header.identifier",
      "short" : "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries).",
      "min" : 1
    },
    {
      "id" : "EHDSImagingStudy.header.version",
      "path" : "EHDSImagingStudy.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSImagingStudy.header.author[x]",
      "path" : "EHDSImagingStudy.header.author[x]",
      "short" : "Author of the resource.",
      "min" : 1
    },
    {
      "id" : "EHDSImagingStudy.header.date",
      "path" : "EHDSImagingStudy.header.date",
      "short" : "Date and optionally time when the imaging study representation or manifest was authored or issued, distinct from the date and time when the imaging study started.",
      "min" : 1
    },
    {
      "id" : "EHDSImagingStudy.header.status",
      "path" : "EHDSImagingStudy.header.status",
      "short" : "Status of the resource. Where the source representation does not provide a reliable life cycle status, ‘unknown’ may be used. Status available shall be used only where availability has been established.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Imaging Study Status"
      }
    },
    {
      "id" : "EHDSImagingStudy.presentedForm",
      "path" : "EHDSImagingStudy.presentedForm",
      "short" : "PDF version of the imaging study to be used where DICOM version is not available. This is a fallback option and is not intended to replace the exchange of DICOM imaging studies.",
      "definition" : "PDF version of the imaging study to be used where DICOM version is not available. This is a fallback option and is not intended to replace the exchange of DICOM imaging studies.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment"
      }]
    },
    {
      "id" : "EHDSImagingStudy.modality",
      "path" : "EHDSImagingStudy.modality",
      "short" : "All of the distinct values for series’ modalities.",
      "definition" : "All of the distinct values for series’ modalities.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "DICOM CID 33 Modality"
      }
    },
    {
      "id" : "EHDSImagingStudy.bodySite",
      "path" : "EHDSImagingStudy.bodySite",
      "short" : "All of the distinct values for series’ examined body parts.",
      "definition" : "All of the distinct values for series’ examined body parts.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSImagingStudy.encounter",
      "path" : "EHDSImagingStudy.encounter",
      "short" : "Reference to the encounter with which this imaging study is associated.",
      "definition" : "Reference to the encounter with which this imaging study is associated.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSEncounter"
      }]
    },
    {
      "id" : "EHDSImagingStudy.started",
      "path" : "EHDSImagingStudy.started",
      "short" : "Date and time the study started.",
      "definition" : "Date and time the study started.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSImagingStudy.basedOn",
      "path" : "EHDSImagingStudy.basedOn",
      "short" : "Reference to the diagnostic request that resulted in this imaging study being performed.",
      "definition" : "Reference to the diagnostic request that resulted in this imaging study being performed.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSServiceRequest"
      }]
    },
    {
      "id" : "EHDSImagingStudy.numberOfSeries",
      "path" : "EHDSImagingStudy.numberOfSeries",
      "short" : "Number of series in the study.",
      "definition" : "Number of series in the study.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.numberOfInstances",
      "path" : "EHDSImagingStudy.numberOfInstances",
      "short" : "Number of SOP instances in the study. This value given may be larger than the number of instance elements this resource contains due to resource availability, security or other factors. This element shall be present if at least one instance element is present.",
      "definition" : "Number of SOP instances in the study. This value given may be larger than the number of instance elements this resource contains due to resource availability, security or other factors. This element shall be present if at least one instance element is present.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.description",
      "path" : "EHDSImagingStudy.description",
      "short" : "The imaging manager description of the study. Institution-generated description or classification of the study (component) performed.",
      "definition" : "The imaging manager description of the study. Institution-generated description or classification of the study (component) performed.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingStudy.custodian",
      "path" : "EHDSImagingStudy.custodian",
      "short" : "Organisation name, address, contact information.",
      "definition" : "Organisation name, address, contact information.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSImagingStudy.endpoint",
      "path" : "EHDSImagingStudy.endpoint",
      "short" : "Study endpoint describing the technical details of a location that may be connected to for the retrieval of the imaging study or display of the study in a remote viewer. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services.",
      "definition" : "Study endpoint describing the technical details of a location that may be connected to for the retrieval of the imaging study or display of the study in a remote viewer. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSEndpoint"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series",
      "path" : "EHDSImagingStudy.series",
      "short" : "Series. Each study has one or more series of instances.",
      "definition" : "Series. Each study has one or more series of instances.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.seriesUid",
      "path" : "EHDSImagingStudy.series.seriesUid",
      "short" : "DICOM Series Instance Unique Identifier (UID) for the series.",
      "definition" : "DICOM Series Instance Unique Identifier (UID) for the series.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.number",
      "path" : "EHDSImagingStudy.series.number",
      "short" : "Numeric identifier of this series.",
      "definition" : "Numeric identifier of this series.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.seriesModality",
      "path" : "EHDSImagingStudy.series.seriesModality",
      "short" : "Acquisition modality used for this series.",
      "definition" : "Acquisition modality used for this series.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "DICOM CID 29 Acquisition Modality"
      }
    },
    {
      "id" : "EHDSImagingStudy.series.description",
      "path" : "EHDSImagingStudy.series.description",
      "short" : "A short human-readable summary of the series.",
      "definition" : "A short human-readable summary of the series.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.numberOfInstances",
      "path" : "EHDSImagingStudy.series.numberOfInstances",
      "short" : "Number of series-related instances.",
      "definition" : "Number of series-related instances.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.seriesEndpoint",
      "path" : "EHDSImagingStudy.series.seriesEndpoint",
      "short" : "Series endpoint describing the technical details of a location that may be connected to for the retrieval of the series. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services.",
      "definition" : "Series endpoint describing the technical details of a location that may be connected to for the retrieval of the series. Sufficient information is required to ensure that a connection is made securely, and appropriate data transmitted as defined by the endpoint owner. These may be locally hosted services, regional services or national services.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSEndpoint"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.bodySite",
      "path" : "EHDSImagingStudy.series.bodySite",
      "short" : "Body part examined.",
      "definition" : "Body part examined.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSBodyStructure"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.specimen",
      "path" : "EHDSImagingStudy.series.specimen",
      "short" : "Specimen imaged.",
      "definition" : "Specimen imaged.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSpecimen"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.started",
      "path" : "EHDSImagingStudy.series.started",
      "short" : "Date and time when the series started.",
      "definition" : "Date and time when the series started.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries",
      "short" : "Instance that is part of the series.",
      "definition" : "Instance that is part of the series.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.instanceTitle",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.instanceTitle",
      "short" : "Instance title that is the description of the instance.",
      "definition" : "Instance title that is the description of the instance.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.instanceUid",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.instanceUid",
      "short" : "DICOM SOP Instance UID.",
      "definition" : "DICOM SOP Instance UID.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.sopClass",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.sopClass",
      "short" : "SOP class – DICOM class type.",
      "definition" : "SOP class – DICOM class type.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.instanceNumber",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.instanceNumber",
      "short" : "The number of this instance in the series.",
      "definition" : "The number of this instance in the series.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.numberOfFrames",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.numberOfFrames",
      "short" : "The number of frames in a multiframe instance.",
      "definition" : "The number of frames in a multiframe instance.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage",
      "short" : "List of key image flags with a reason why this image is selected as a key image, and reference to the Key Image Note that flags the image as significant.",
      "definition" : "List of key image flags with a reason why this image is selected as a key image, and reference to the Key Image Note that flags the image as significant.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage.flag",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage.flag",
      "short" : "Reason for flagging the image as significant.",
      "definition" : "Reason for flagging the image as significant.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "DICOM PS3.16 CID 7010"
      }
    },
    {
      "id" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage.reason",
      "path" : "EHDSImagingStudy.series.instanceInTheSeries.keyImage.reason",
      "short" : "Textual reason for flagging the image as significant.",
      "definition" : "Textual reason for flagging the image as significant.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
