# Immunisation model - EHDS Logical Information Models v0.1.0

## Logical Model: Immunisation model 

 
EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning. 

**Usages:**

* Use this Logical Model: [Medical test result and report model](StructureDefinition-EHDSMedicalTestResultAndReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSImmunisation.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSImmunisation.csv), [Excel](../StructureDefinition-EHDSImmunisation.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSImmunisation",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation",
  "version" : "0.1.0",
  "name" : "EHDSImmunisation",
  "title" : "Immunisation model",
  "status" : "draft",
  "date" : "2026-07-24T10:04:43+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSImmunisation",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSImmunisation",
      "path" : "EHDSImmunisation",
      "short" : "Immunisation model",
      "definition" : "EHDSImmunisation means a structured set of data elements describing the administration of a vaccine or immunoglobulin, but excluding natural immunity, immunisation outcomes, refusals, and administration planning."
    },
    {
      "id" : "EHDSImmunisation.header",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header"
    },
    {
      "id" : "EHDSImmunisation.header.subject",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.subject"
    },
    {
      "id" : "EHDSImmunisation.header.identifier",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.identifier"
    },
    {
      "id" : "EHDSImmunisation.header.author[x]",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.author[x]"
    },
    {
      "id" : "EHDSImmunisation.header.patientInsertedData",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.patientInsertedData"
    },
    {
      "id" : "EHDSImmunisation.header.date",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.date"
    },
    {
      "id" : "EHDSImmunisation.header.status",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.status",
      "short" : "Status of the immunisation event, e.g., completed, not-done.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Immunization Status Codes"
      }
    },
    {
      "id" : "EHDSImmunisation.header.language",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.header.language"
    },
    {
      "id" : "EHDSImmunisation.diseaseOrAgentTargeted",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.diseaseOrAgentTargeted",
      "short" : "Disease or agent that the vaccination provides protection against.",
      "definition" : "Disease or agent that the vaccination provides protection against.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10"
      }
    },
    {
      "id" : "EHDSImmunisation.vaccine",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.vaccine",
      "short" : "Type of immunisation.",
      "definition" : "Type of immunisation.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "ATC (preferred), SNOMED GPS"
      }
    },
    {
      "id" : "EHDSImmunisation.administeredProduct",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.administeredProduct",
      "short" : "Administered medicinal product, including batch/lot details when necessary.",
      "definition" : "Administered medicinal product, including batch/lot details when necessary.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSImmunisation.administrationTime",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHALL:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.administrationTime",
      "short" : "The date and optionally the exact time when the vaccination was administered.",
      "definition" : "The date and optionally the exact time when the vaccination was administered.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "EHDSImmunisation.administeringCentre",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.administeringCentre",
      "short" : "Administering centre or a health authority responsible for the vaccination event.",
      "definition" : "Administering centre or a health authority responsible for the vaccination event.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSImmunisation.administrator",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.administrator",
      "short" : "Health professional responsible for administering the immunisation product.",
      "definition" : "Health professional responsible for administering the immunisation product.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      }]
    },
    {
      "id" : "EHDSImmunisation.note",
      "extension" : [{
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-full"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      },
      {
        "extension" : [{
          "url" : "code",
          "valueCode" : "SHOULD:process"
        },
        {
          "url" : "actor",
          "valueCanonical" : "https://ehds.eu/specifications/fhir/actor-basic"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/obligation"
      }],
      "path" : "EHDSImmunisation.note",
      "short" : "Free text notes by the health professional.",
      "definition" : "Free text notes by the health professional.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
