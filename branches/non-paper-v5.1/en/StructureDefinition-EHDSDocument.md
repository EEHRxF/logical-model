# Document model - EHDS Logical Information Models v0.3.0

## Logical Model: Document model 

**Usages:**

* Derived from this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSDocument.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSDocument.csv), [Excel](../StructureDefinition-EHDSDocument.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSDocument",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocument",
  "version" : "0.3.0",
  "name" : "EHDSDocument",
  "title" : "Document model",
  "status" : "draft",
  "date" : "2026-11-21T16:13:39+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSDocument means a structured set of data elements common all health documents. Additional document search metadata is defined separately in EHDSDocumentSearchMetadata.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocument",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSDocument",
      "path" : "EHDSDocument",
      "short" : "Document model",
      "definition" : "EHDSDocument means a structured set of data elements common all health documents. Additional document search metadata is defined separately in EHDSDocumentSearchMetadata."
    },
    {
      "id" : "EHDSDocument.header",
      "path" : "EHDSDocument.header",
      "short" : "Document header."
    },
    {
      "id" : "EHDSDocument.header.identifier",
      "path" : "EHDSDocument.header.identifier",
      "short" : "Unique identifier of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocument.header.version",
      "path" : "EHDSDocument.header.version",
      "short" : "Version of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocument.header.author[x]",
      "path" : "EHDSDocument.header.author[x]",
      "short" : "Information describing who authored the resource or document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocument.header.date",
      "path" : "EHDSDocument.header.date",
      "short" : "Date of finalisation/issuance of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocument.header.status",
      "path" : "EHDSDocument.header.status",
      "short" : "Status of the document.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Composition Status"
      }
    },
    {
      "id" : "EHDSDocument.header.language",
      "path" : "EHDSDocument.header.language",
      "short" : "Language in which the document is written. Language is expressed by the IETF language tag."
    },
    {
      "id" : "EHDSDocument.header.documentCategory",
      "path" : "EHDSDocument.header.documentCategory",
      "short" : "Broad category of document (e.g. 11502-2 Laboratory report).",
      "definition" : "Broad category of document (e.g. 11502-2 Laboratory report).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "LOINC"
      }
    },
    {
      "id" : "EHDSDocument.header.documentType",
      "path" : "EHDSDocument.header.documentType",
      "short" : "Type of document (e.g. 18725-2 Microbiology studies (set)).",
      "definition" : "Type of document (e.g. 18725-2 Microbiology studies (set)).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "LOINC"
      }
    },
    {
      "id" : "EHDSDocument.header.documentTitle",
      "path" : "EHDSDocument.header.documentTitle",
      "short" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’.",
      "definition" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDocument.header.period",
      "path" : "EHDSDocument.header.period",
      "short" : "Time of service that is being documented.",
      "definition" : "Time of service that is being documented.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSDocument.header.attestation",
      "path" : "EHDSDocument.header.attestation",
      "short" : "Document attestation details.",
      "definition" : "Document attestation details.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSDocument.header.attestation.attester[x]",
      "path" : "EHDSDocument.header.attestation.attester[x]",
      "short" : "Attester who validated the document.",
      "definition" : "Attester who validated the document.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSDocument.header.attestation.dateTime",
      "path" : "EHDSDocument.header.attestation.dateTime",
      "short" : "Date and time of the approval of the document by the attester.",
      "definition" : "Date and time of the approval of the document by the attester.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSDocument.header.legalAuthentication",
      "path" : "EHDSDocument.header.legalAuthentication",
      "short" : "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile.",
      "definition" : "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSDocument.header.legalAuthentication.legalAuthenticator[x]",
      "path" : "EHDSDocument.header.legalAuthentication.legalAuthenticator[x]",
      "short" : "The person taking responsibility for the medical content of the document. legalAuthenticator may be different from author and attester (e.g author=junior doctor, attester=senior physician, legalAuthenticator= attending physician).",
      "definition" : "The person taking responsibility for the medical content of the document. legalAuthenticator may be different from author and attester (e.g author=junior doctor, attester=senior physician, legalAuthenticator= attending physician).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSDocument.header.legalAuthentication.dateTime",
      "path" : "EHDSDocument.header.legalAuthentication.dateTime",
      "short" : "Date and time when the document was authorised.",
      "definition" : "Date and time when the document was authorised.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSDocument.header.eventCategory",
      "path" : "EHDSDocument.header.eventCategory",
      "short" : "Categorisation of the event covered by the document (e.g. laboratory study types, imaging study types including modality). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes.",
      "definition" : "Categorisation of the event covered by the document (e.g. laboratory study types, imaging study types including modality). Selection of such tags or labels depends on the use case and agreement between data-sharing parties. This metadata element serves primarily for searching and filtering purposes.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS, LOINC, DICOM CID 33 Modality"
      }
    },
    {
      "id" : "EHDSDocument.header.serviceSpecialty",
      "path" : "EHDSDocument.header.serviceSpecialty",
      "short" : "Additional details about where the content was created (e.g. clinical speciality).",
      "definition" : "Additional details about where the content was created (e.g. clinical speciality).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSDocument.header.custodian",
      "path" : "EHDSDocument.header.custodian",
      "short" : "Organisation that is in charge of maintaining the document.",
      "definition" : "Organisation that is in charge of maintaining the document.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSDocument.header.countryOfOrigin",
      "path" : "EHDSDocument.header.countryOfOrigin",
      "short" : "Country of origin of the document.",
      "definition" : "Country of origin of the document.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "ISO 3166-1 alpha-2"
      }
    },
    {
      "id" : "EHDSDocument.presentedForm",
      "path" : "EHDSDocument.presentedForm",
      "short" : "A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document.",
      "definition" : "A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment"
      }]
    }]
  }
}

```
