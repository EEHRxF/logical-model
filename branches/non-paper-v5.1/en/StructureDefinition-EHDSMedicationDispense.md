# Medication dispense model. - EHDS Logical Information Models v0.3.0

## Logical Model: Medication dispense model. 

**Usages:**

* Use this Logical Model: [Medication use model](StructureDefinition-EHDSMedicationUse.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedicationDispense.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedicationDispense.csv), [Excel](../StructureDefinition-EHDSMedicationDispense.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedicationDispense",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationDispense",
  "version" : "0.3.0",
  "name" : "EHDSMedicationDispense",
  "title" : "Medication dispense model.",
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
  "description" : "Electronic dispensation.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationDispense",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedicationDispense",
      "path" : "EHDSMedicationDispense",
      "short" : "Medication dispense model.",
      "definition" : "Electronic dispensation."
    },
    {
      "id" : "EHDSMedicationDispense.header",
      "path" : "EHDSMedicationDispense.header",
      "short" : "Dispensation header."
    },
    {
      "id" : "EHDSMedicationDispense.header.identifier",
      "path" : "EHDSMedicationDispense.header.identifier",
      "short" : "Business identifier for the dispensation.",
      "min" : 1
    },
    {
      "id" : "EHDSMedicationDispense.header.version",
      "path" : "EHDSMedicationDispense.header.version",
      "max" : "0"
    },
    {
      "id" : "EHDSMedicationDispense.header.author[x]",
      "path" : "EHDSMedicationDispense.header.author[x]",
      "short" : "Author of the document.",
      "min" : 1
    },
    {
      "id" : "EHDSMedicationDispense.header.date",
      "path" : "EHDSMedicationDispense.header.date",
      "short" : "Date and time of issuance of the dispensation record.",
      "min" : 1
    },
    {
      "id" : "EHDSMedicationDispense.header.status",
      "path" : "EHDSMedicationDispense.header.status",
      "short" : "The status of the dispensation, e.g. completed, declined, entered-in-error.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Medication Dispense Status Codes"
      }
    },
    {
      "id" : "EHDSMedicationDispense.header.language",
      "path" : "EHDSMedicationDispense.header.language",
      "short" : "Language in which the document is written. Language is expressed by the IETF language tag."
    },
    {
      "id" : "EHDSMedicationDispense.dispenseLocation",
      "path" : "EHDSMedicationDispense.dispenseLocation",
      "short" : "Location of dispense.",
      "definition" : "Location of dispense.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSOrganisation"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.receiver[x]",
      "path" : "EHDSMedicationDispense.receiver[x]",
      "short" : "Identification of the person who received the dispensed medicinal products, especially when it was not the patient. When not present, it is assumed that the patient is the receiver.",
      "definition" : "Identification of the person who received the dispensed medicinal products, especially when it was not the patient. When not present, it is assumed that the patient is the receiver.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSPatient"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSRelatedPerson"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.relatedRequest",
      "path" : "EHDSMedicationDispense.relatedRequest",
      "short" : "Identifier of the prescription item the dispensation is related to.",
      "definition" : "Identifier of the prescription item the dispensation is related to.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.medication",
      "path" : "EHDSMedicationDispense.medication",
      "short" : "Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.",
      "definition" : "Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.dispensedQuantity",
      "path" : "EHDSMedicationDispense.dispensedQuantity",
      "short" : "Number of dispensed packages if the package size is known, or number of smaller items/units, depending on the medicinal product dispensed. A unit shall be provided.",
      "definition" : "Number of dispensed packages if the package size is known, or number of smaller items/units, depending on the medicinal product dispensed. A unit shall be provided.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measurement, EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedicationDispense.substitutionOccurred",
      "path" : "EHDSMedicationDispense.substitutionOccurred",
      "short" : "Whether substitution was made by the dispenser. Definition of substitution is specific to the jurisdiction.",
      "definition" : "Whether substitution was made by the dispenser. Definition of substitution is specific to the jurisdiction.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.dosageInstructions",
      "path" : "EHDSMedicationDispense.dosageInstructions",
      "short" : "Dosage and administration instructions for the dispensed medicinal product. These instructions may deviate from the instructions included in the prescription.",
      "definition" : "Dosage and administration instructions for the dispensed medicinal product. These instructions may deviate from the instructions included in the prescription.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDosage"
      }]
    },
    {
      "id" : "EHDSMedicationDispense.note",
      "path" : "EHDSMedicationDispense.note",
      "short" : "Additional information or comments.",
      "definition" : "Additional information or comments.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
