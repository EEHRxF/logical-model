# Document search metadata model - EHDS Logical Information Models v0.3.0

## Logical Model: Document search metadata model 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSDocumentSearchMetadata.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSDocumentSearchMetadata.csv), [Excel](../StructureDefinition-EHDSDocumentSearchMetadata.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSDocumentSearchMetadata",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocumentSearchMetadata",
  "version" : "0.3.0",
  "name" : "EHDSDocumentSearchMetadata",
  "title" : "Document search metadata model",
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
  "description" : "Metadata for searching documents, based on WP v5 Annex III and the final review instructions. This search-metadata model is separate from EHDSDocument and its resource-content hierarchy.",
  "purpose" : "Document search metadata specialises the independent search-metadata model. It does not include the document's content, presentedForm or countryOfOrigin. Date is mandatory in both this model and EHDSDocument.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDocumentSearchMetadata",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSearchMetadata",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSDocumentSearchMetadata",
      "path" : "EHDSDocumentSearchMetadata",
      "short" : "Document search metadata model",
      "definition" : "Metadata for searching documents, based on WP v5 Annex III and the final review instructions. This search-metadata model is separate from EHDSDocument and its resource-content hierarchy."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.identifier",
      "path" : "EHDSDocumentSearchMetadata.identifier",
      "short" : "Unique identifier of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocumentSearchMetadata.clinicalEventTime[x]",
      "path" : "EHDSDocumentSearchMetadata.clinicalEventTime[x]",
      "max" : "0"
    },
    {
      "id" : "EHDSDocumentSearchMetadata.version",
      "path" : "EHDSDocumentSearchMetadata.version",
      "short" : "Version of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocumentSearchMetadata.author[x]",
      "path" : "EHDSDocumentSearchMetadata.author[x]",
      "short" : "Information describing who authored the resource or document.",
      "min" : 1
    },
    {
      "id" : "EHDSDocumentSearchMetadata.date",
      "path" : "EHDSDocumentSearchMetadata.date",
      "short" : "Date of finalisation/issuance of the document.",
      "comment" : "Final finding 6 and the user require search date 1..1. EHDSDocument.header.date is also 1..1, so document search metadata has no corresponding source-date cardinality conflict."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.attestation",
      "path" : "EHDSDocumentSearchMetadata.attestation",
      "short" : "Document attestation details."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.attestation.attester[x]",
      "path" : "EHDSDocumentSearchMetadata.attestation.attester[x]",
      "short" : "Attester who validated the document."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.attestation.dateTime",
      "path" : "EHDSDocumentSearchMetadata.attestation.dateTime",
      "short" : "Date and time of the approval of the document by the attester."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.status",
      "path" : "EHDSDocumentSearchMetadata.status",
      "short" : "Status of the document.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Composition Status"
      }
    },
    {
      "id" : "EHDSDocumentSearchMetadata.language",
      "path" : "EHDSDocumentSearchMetadata.language",
      "short" : "Language in which the document is written. Language is expressed by the IETF language tag."
    },
    {
      "id" : "EHDSDocumentSearchMetadata.documentCategory",
      "path" : "EHDSDocumentSearchMetadata.documentCategory",
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
      "id" : "EHDSDocumentSearchMetadata.documentType",
      "path" : "EHDSDocumentSearchMetadata.documentType",
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
      "id" : "EHDSDocumentSearchMetadata.documentTitle",
      "path" : "EHDSDocumentSearchMetadata.documentTitle",
      "short" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’.",
      "definition" : "Human-readable document title that may be displayed in search results etc. This may be documentType’s display name, or it may be assembled from multiple elements. Examples: ‘Laboratory result report’, ‘Patient summary of Jane Green 10.12.2024’.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSDocumentSearchMetadata.period",
      "path" : "EHDSDocumentSearchMetadata.period",
      "short" : "Time of service that is being documented.",
      "definition" : "Time of service that is being documented.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSDocumentSearchMetadata.legalAuthentication",
      "path" : "EHDSDocumentSearchMetadata.legalAuthentication",
      "short" : "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile.",
      "definition" : "Document legal authentication details. Legal authentication metadata is included only where required by applicable legal or organisational frameworks. Absence of legal authentication does not affect interoperability compliance under this profile.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSDocumentSearchMetadata.legalAuthentication.legalAuthenticator[x]",
      "path" : "EHDSDocumentSearchMetadata.legalAuthentication.legalAuthenticator[x]",
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
      "id" : "EHDSDocumentSearchMetadata.legalAuthentication.dateTime",
      "path" : "EHDSDocumentSearchMetadata.legalAuthentication.dateTime",
      "short" : "Date and time when the document was authorised.",
      "definition" : "Date and time when the document was authorised.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSDocumentSearchMetadata.eventCategory",
      "path" : "EHDSDocumentSearchMetadata.eventCategory",
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
      "id" : "EHDSDocumentSearchMetadata.serviceSpecialty",
      "path" : "EHDSDocumentSearchMetadata.serviceSpecialty",
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
      "id" : "EHDSDocumentSearchMetadata.custodian",
      "path" : "EHDSDocumentSearchMetadata.custodian",
      "short" : "Organisation that is in charge of maintaining the document.",
      "definition" : "Organisation that is in charge of maintaining the document.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    }]
  }
}

```
