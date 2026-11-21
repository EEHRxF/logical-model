# Data group search metadata model - EHDS Logical Information Models v0.3.0

## Logical Model: Data group search metadata model 

**Usages:**

* Derived from this Logical Model: [Document search metadata model](StructureDefinition-EHDSDocumentSearchMetadata.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSSearchMetadata.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSSearchMetadata.csv), [Excel](../StructureDefinition-EHDSSearchMetadata.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSSearchMetadata",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSearchMetadata",
  "version" : "0.3.0",
  "name" : "EHDSSearchMetadata",
  "title" : "Data group search metadata model",
  "status" : "draft",
  "date" : "2026-11-21T16:14:41+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "Metadata for searching individual data groups, based on WP v5 Annex III and the final review instructions. This model is independent of the resource-content model EHDSDataSet.",
  "purpose" : "Search metadata is not a parent of resource-content models. Date is mandatory under final finding 6 and the user's explicit decision. Its availability when the source resource has no date is an open specification issue; no derivation or fallback rule has been agreed.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSSearchMetadata",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSSearchMetadata",
      "path" : "EHDSSearchMetadata",
      "short" : "Data group search metadata model",
      "definition" : "Metadata for searching individual data groups, based on WP v5 Annex III and the final review instructions. This model is independent of the resource-content model EHDSDataSet."
    },
    {
      "id" : "EHDSSearchMetadata.subject",
      "path" : "EHDSSearchMetadata.subject",
      "short" : "Patient/subject information.",
      "definition" : "Patient/subject information.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.identifier",
      "path" : "EHDSSearchMetadata.identifier",
      "short" : "Unique identifier of the resource.",
      "definition" : "Unique identifier of the resource.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.clinicalEventTime[x]",
      "path" : "EHDSSearchMetadata.clinicalEventTime[x]",
      "short" : "Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).",
      "definition" : "Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.version",
      "path" : "EHDSSearchMetadata.version",
      "short" : "Version of the resource.",
      "definition" : "Version of the resource.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.author[x]",
      "path" : "EHDSSearchMetadata.author[x]",
      "short" : "Information describing who authored the resource.",
      "definition" : "Information describing who authored the resource.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.date",
      "path" : "EHDSSearchMetadata.date",
      "short" : "Date of finalisation/issuance of the resource.",
      "definition" : "Date of finalisation/issuance of the resource.",
      "comment" : "The user explicitly selected 1..1 in search metadata, whereas EHDSDataSet.header.date and some individual resource dates are 0..1. This unresolved mismatch requires clarification of the metadata requirement or a rule for obtaining the missing date. No fallback date is defined.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.attestation",
      "path" : "EHDSSearchMetadata.attestation",
      "short" : "Resource attestation details.",
      "definition" : "Resource attestation details.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.attestation.attester[x]",
      "path" : "EHDSSearchMetadata.attestation.attester[x]",
      "short" : "Attester who validated the resource.",
      "definition" : "Attester who validated the resource.",
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
      "id" : "EHDSSearchMetadata.attestation.dateTime",
      "path" : "EHDSSearchMetadata.attestation.dateTime",
      "short" : "Date and time of the approval of the resource by the attester.",
      "definition" : "Date and time of the approval of the resource by the attester.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSSearchMetadata.status",
      "path" : "EHDSSearchMetadata.status",
      "short" : "Status of the resource.",
      "definition" : "Status of the resource.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "In accordance with the status ‘binding’ in the corresponding data group"
      }
    },
    {
      "id" : "EHDSSearchMetadata.language",
      "path" : "EHDSSearchMetadata.language",
      "short" : "Language in which the resource is written. Language is expressed by the IETF language tag.",
      "definition" : "Language in which the resource is written. Language is expressed by the IETF language tag.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "BCP 47"
      }
    },
    {
      "id" : "EHDSSearchMetadata.lastUpdate",
      "path" : "EHDSSearchMetadata.lastUpdate",
      "short" : "Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.",
      "definition" : "Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
