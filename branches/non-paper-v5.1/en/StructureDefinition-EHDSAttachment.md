# Attachment model - EHDS Logical Information Models v0.3.0

## Logical Model: Attachment model 

**Usages:**

* Use this Logical Model: [Advance directive model](StructureDefinition-EHDSAdvanceDirective.md), [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Document model](StructureDefinition-EHDSDocument.md), [Imaging report model.](StructureDefinition-EHDSImagingReport.md)... Show 3 more, [Imaging study model.](StructureDefinition-EHDSImagingStudy.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md) and [Electronic prescription model](StructureDefinition-EHDSMedicationPrescription.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSAttachment.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSAttachment.csv), [Excel](../StructureDefinition-EHDSAttachment.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSAttachment",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment",
  "version" : "0.3.0",
  "name" : "EHDSAttachment",
  "title" : "Attachment model",
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
  "description" : "EHDSAttachment means a structured set of data elements describing additional content, in a format identifiable by a MIME type, including images, clinical reports, or other documents.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSAttachment",
      "path" : "EHDSAttachment",
      "short" : "Attachment model",
      "definition" : "EHDSAttachment means a structured set of data elements describing additional content, in a format identifiable by a MIME type, including images, clinical reports, or other documents."
    },
    {
      "id" : "EHDSAttachment.contentType",
      "path" : "EHDSAttachment.contentType",
      "short" : "The Multipurpose Internet Mail Extensions (MIME) type identifying the format of the content in the attachment. Where applicable, it includes a parameter specifying the character encoding used for text content (e.g. “text/plain; charset=UTF-8”).",
      "definition" : "The Multipurpose Internet Mail Extensions (MIME) type identifying the format of the content in the attachment. Where applicable, it includes a parameter specifying the character encoding used for text content (e.g. “text/plain; charset=UTF-8”).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "BCP 13"
      }
    },
    {
      "id" : "EHDSAttachment.language",
      "path" : "EHDSAttachment.language",
      "short" : "Human language of the content.",
      "definition" : "Human language of the content.",
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
      "id" : "EHDSAttachment.data",
      "path" : "EHDSAttachment.data",
      "short" : "The actual data of the attachment – a sequence of bytes, base64-encoded.",
      "definition" : "The actual data of the attachment – a sequence of bytes, base64-encoded.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "base64Binary"
      }]
    },
    {
      "id" : "EHDSAttachment.url",
      "path" : "EHDSAttachment.url",
      "short" : "A location where the data may be accessed.",
      "definition" : "A location where the data may be accessed.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "EHDSAttachment.size",
      "path" : "EHDSAttachment.size",
      "short" : "The number of bytes of data that make up this attachment (before base64 encoding).",
      "definition" : "The number of bytes of data that make up this attachment (before base64 encoding).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSAttachment.title",
      "path" : "EHDSAttachment.title",
      "short" : "A label or set of text to display in place of the data.",
      "definition" : "A label or set of text to display in place of the data.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
