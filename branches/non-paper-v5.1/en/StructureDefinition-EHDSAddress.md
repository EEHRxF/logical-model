# Address model - EHDS Logical Information Models v0.3.0

## Logical Model: Address model 

**Usages:**

* Use this Logical Model: [Health professional model](StructureDefinition-EHDSHealthProfessional.md), [Location model](StructureDefinition-EHDSLocation.md), [Organisation model](StructureDefinition-EHDSOrganisation.md), [Patient model](StructureDefinition-EHDSPatient.md) and [Related person model](StructureDefinition-EHDSRelatedPerson.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSAddress.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSAddress.csv), [Excel](../StructureDefinition-EHDSAddress.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSAddress",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress",
  "version" : "0.3.0",
  "name" : "EHDSAddress",
  "title" : "Address model",
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
  "description" : "EHDSAddress means the structured set of data elements identifying a geographical or postal location.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAddress",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSAddress",
      "path" : "EHDSAddress",
      "short" : "Address model",
      "definition" : "EHDSAddress means the structured set of data elements identifying a geographical or postal location."
    },
    {
      "id" : "EHDSAddress.use",
      "path" : "EHDSAddress.use",
      "short" : "Purpose of the address. If this attribute is not present, the address is assumed to be the default address useful for any purpose.",
      "definition" : "Purpose of the address. If this attribute is not present, the address is assumed to be the default address useful for any purpose.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Address Use"
      }
    },
    {
      "id" : "EHDSAddress.type",
      "path" : "EHDSAddress.type",
      "short" : "Distinguishes between physical addresses (those that may be visited) and mailing addresses. Most addresses are both.",
      "definition" : "Distinguishes between physical addresses (those that may be visited) and mailing addresses. Most addresses are both.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Address Type"
      }
    },
    {
      "id" : "EHDSAddress.text",
      "path" : "EHDSAddress.text",
      "short" : "Text representation of the address.",
      "definition" : "Text representation of the address.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.street",
      "path" : "EHDSAddress.street",
      "short" : "Name of the street.",
      "definition" : "Name of the street.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.houseNumber",
      "path" : "EHDSAddress.houseNumber",
      "short" : "House number.",
      "definition" : "House number.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.postBox",
      "path" : "EHDSAddress.postBox",
      "short" : "Postbox.",
      "definition" : "Postbox.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.city",
      "path" : "EHDSAddress.city",
      "short" : "City.",
      "definition" : "City.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.postalCode",
      "path" : "EHDSAddress.postalCode",
      "short" : "Postal code.",
      "definition" : "Postal code.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSAddress.country",
      "path" : "EHDSAddress.country",
      "short" : "Country name and country code.",
      "definition" : "Country name and country code.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "ISO 3166-1 alpha-2"
      }
    }]
  }
}

```
