# Endpoint model - EHDS Logical Information Models v0.3.0

## Logical Model: Endpoint model 

**Usages:**

* Use this Logical Model: [Imaging study model.](StructureDefinition-EHDSImagingStudy.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSEndpoint.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSEndpoint.csv), [Excel](../StructureDefinition-EHDSEndpoint.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSEndpoint",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSEndpoint",
  "version" : "0.3.0",
  "name" : "EHDSEndpoint",
  "title" : "Endpoint model",
  "status" : "draft",
  "date" : "2026-11-18T22:38:10+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSEndpoint means a structured set of data elements describing the technical details of a connection point for electronic services.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSEndpoint",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSEndpoint",
      "path" : "EHDSEndpoint",
      "short" : "Endpoint model",
      "definition" : "EHDSEndpoint means a structured set of data elements describing the technical details of a connection point for electronic services."
    },
    {
      "id" : "EHDSEndpoint.identifier",
      "path" : "EHDSEndpoint.identifier",
      "short" : "Identifier for the endpoint.",
      "definition" : "Identifier for the endpoint.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSEndpoint.status",
      "path" : "EHDSEndpoint.status",
      "short" : "Status of the endpoint, e.g. active, limited.",
      "definition" : "Status of the endpoint, e.g. active, limited.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Endpoint Status"
      }
    },
    {
      "id" : "EHDSEndpoint.connectionType",
      "path" : "EHDSEndpoint.connectionType",
      "short" : "A coded value identifying the technical protocol, profile or standard used to connect to and communicate with the endpoint.",
      "definition" : "A coded value identifying the technical protocol, profile or standard used to connect to and communicate with the endpoint.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Endpoint Connection Type"
      }
    },
    {
      "id" : "EHDSEndpoint.name",
      "path" : "EHDSEndpoint.name",
      "short" : "A friendly name that this endpoint may be referred to with.",
      "definition" : "A friendly name that this endpoint may be referred to with.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSEndpoint.managingOrganisation",
      "path" : "EHDSEndpoint.managingOrganisation",
      "short" : "The organisation that provides technical management services for this endpoint.",
      "definition" : "The organisation that provides technical management services for this endpoint.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSEndpoint.payload",
      "path" : "EHDSEndpoint.payload",
      "short" : "The set of payloads that are provided/available at this endpoint.",
      "definition" : "The set of payloads that are provided/available at this endpoint.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSEndpoint.payload.mimeType",
      "path" : "EHDSEndpoint.payload.mimeType",
      "short" : "The MIME type to send the payload in (e.g. application/fhir+xml, application/fhir+json).",
      "definition" : "The MIME type to send the payload in (e.g. application/fhir+xml, application/fhir+json).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "BCP 13"
      }
    },
    {
      "id" : "EHDSEndpoint.payload.profileCanonical",
      "path" : "EHDSEndpoint.payload.profileCanonical",
      "short" : "The technical profile that is required at this endpoint. It describes the resources that are handled, or even simply which resource types.",
      "definition" : "The technical profile that is required at this endpoint. It describes the resources that are handled, or even simply which resource types.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSEndpoint.payload.profileUri",
      "path" : "EHDSEndpoint.payload.profileUri",
      "short" : "The profile (as a uniform resource identifier (URI)) that is required at this endpoint when not represented using an FHIR profile.",
      "definition" : "The profile (as a uniform resource identifier (URI)) that is required at this endpoint when not represented using an FHIR profile.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSEndpoint.address",
      "path" : "EHDSEndpoint.address",
      "short" : "The URI that describes the actual endpoint to connect to.",
      "definition" : "The URI that describes the actual endpoint to connect to.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSEndpoint.header",
      "path" : "EHDSEndpoint.header",
      "short" : "Additional headers/information to send as part of the notification. Usage depends on the channel type.",
      "definition" : "Additional headers/information to send as part of the notification. Usage depends on the channel type.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
