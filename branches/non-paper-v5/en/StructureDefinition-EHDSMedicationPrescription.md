# Electronic prescription model - EHDS Logical Information Models v0.3.0

## Logical Model: Electronic prescription model 

**Usages:**

* Use this Logical Model: [Medication use model](StructureDefinition-EHDSMedicationUse.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedicationPrescription.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedicationPrescription.csv), [Excel](../StructureDefinition-EHDSMedicationPrescription.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedicationPrescription",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationPrescription",
  "version" : "0.3.0",
  "name" : "EHDSMedicationPrescription",
  "title" : "Electronic prescription model",
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
  "description" : "Electronic prescription.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedicationPrescription",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedicationPrescription",
      "path" : "EHDSMedicationPrescription",
      "short" : "Electronic prescription model",
      "definition" : "Electronic prescription."
    },
    {
      "id" : "EHDSMedicationPrescription.header",
      "path" : "EHDSMedicationPrescription.header",
      "short" : "Prescription header."
    },
    {
      "id" : "EHDSMedicationPrescription.header.subject",
      "path" : "EHDSMedicationPrescription.header.subject",
      "short" : "The person for whom a medicinal product is prescribed/ordered."
    },
    {
      "id" : "EHDSMedicationPrescription.header.identifier",
      "path" : "EHDSMedicationPrescription.header.identifier",
      "short" : "Business identifier(s) for the prescription."
    },
    {
      "id" : "EHDSMedicationPrescription.header.author[x]",
      "path" : "EHDSMedicationPrescription.header.author[x]",
      "short" : "Author of the document.",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSHealthProfessional"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.header.date",
      "path" : "EHDSMedicationPrescription.header.date",
      "short" : "Date and time of issuance (signature) of the prescription by prescriber.",
      "min" : 1
    },
    {
      "id" : "EHDSMedicationPrescription.header.status",
      "path" : "EHDSMedicationPrescription.header.status",
      "short" : "Status of authorisation for dispensing the prescription items. For a multiple-item prescription, this conveys the aggregate status of the entire prescription. In the case of a single-item prescription, prescriptionItem.status shall be the same as header.status.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Medication Request Status"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.header.language",
      "path" : "EHDSMedicationPrescription.header.language",
      "short" : "Language in which the document is written. Language is expressed by the IETF language tag."
    },
    {
      "id" : "EHDSMedicationPrescription.header.statusReason[x]",
      "path" : "EHDSMedicationPrescription.header.statusReason[x]",
      "short" : "Reason for the current status of prescription, for example the reason why the prescription was cancelled or changed from a previous state.",
      "definition" : "Reason for the current status of prescription, for example the reason why the prescription was cancelled or changed from a previous state.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.presentedForm",
      "path" : "EHDSMedicationPrescription.presentedForm",
      "short" : "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document.",
      "definition" : "A narrative easy-to-read representation of the full dataset, e.g. PDF version of a document.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAttachment"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem",
      "path" : "EHDSMedicationPrescription.prescriptionItem",
      "short" : "Prescription line for one medicinal product. If multiple medicinal products are prescribed, all items need to be authored together.",
      "definition" : "Prescription line for one medicinal product. If multiple medicinal products are prescribed, all items need to be authored together.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.identifier",
      "path" : "EHDSMedicationPrescription.prescriptionItem.identifier",
      "short" : "Identifier for a single item on the prescription. This identifier may be linked to the prescription identifier. In the case of a multiple-line prescription, this identifier may be constructed, for example, as the prescription identifier combined with the line number.",
      "definition" : "Identifier for a single item on the prescription. This identifier may be linked to the prescription identifier. In the case of a multiple-line prescription, this identifier may be constructed, for example, as the prescription identifier combined with the line number.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.status",
      "path" : "EHDSMedicationPrescription.prescriptionItem.status",
      "short" : "Status of a single item on prescription. In the case of a single-item prescription, the status of the prescription has the same meaning as the status of the item.",
      "definition" : "Status of a single item on prescription. In the case of a single-item prescription, the status of the prescription has the same meaning as the status of the item.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Medication Request Status"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.statusReason[x]",
      "path" : "EHDSMedicationPrescription.prescriptionItem.statusReason[x]",
      "short" : "Reason for the current status of prescription item, for example the reason why the prescription was cancelled or why the prescription was changed from the previous status.",
      "definition" : "Reason for the current status of prescription item, for example the reason why the prescription was cancelled or why the prescription was changed from the previous status.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.medication",
      "path" : "EHDSMedicationPrescription.prescriptionItem.medication",
      "short" : "Prescribed medicinal product.",
      "definition" : "Prescribed medicinal product.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.indication[x]",
      "path" : "EHDSMedicationPrescription.prescriptionItem.indication[x]",
      "short" : "Reason for the prescription (typically diagnosis, or a procedure).",
      "definition" : "Reason for the prescription (typically diagnosis, or a procedure).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS (preferred), ICD-10, Orphacode"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.intendedUseType",
      "path" : "EHDSMedicationPrescription.prescriptionItem.intendedUseType",
      "short" : "Intent of the prescription – prophylaxis, treatment, anaesthesia, etc.",
      "definition" : "Intent of the prescription – prophylaxis, treatment, anaesthesia, etc.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.periodOfUse",
      "path" : "EHDSMedicationPrescription.prescriptionItem.periodOfUse",
      "short" : "Period over which the medicinal product is to be taken (in the case of multiple dosage schemes, this shall be the overall period of all dosages).",
      "definition" : "Period over which the medicinal product is to be taken (in the case of multiple dosage schemes, this shall be the overall period of all dosages).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.quantityPrescribed",
      "path" : "EHDSMedicationPrescription.prescriptionItem.quantityPrescribed",
      "short" : "Overall quantity of medicinal product prescribed in this prescription item (e.g. number of packages or number of tablets). Where the total quantity cannot be determined unambiguously at issuance, the prescriber may express it on the basis of dosage instructions, validity period and number of repeats.",
      "definition" : "Overall quantity of medicinal product prescribed in this prescription item (e.g. number of packages or number of tablets). Where the total quantity cannot be determined unambiguously at issuance, the prescriber may express it on the basis of dosage instructions, validity period and number of repeats.",
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
      "id" : "EHDSMedicationPrescription.prescriptionItem.dosageInstructions",
      "path" : "EHDSMedicationPrescription.prescriptionItem.dosageInstructions",
      "short" : "Dosage and administration instructions.",
      "definition" : "Dosage and administration instructions.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDosage"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.validityPeriod",
      "path" : "EHDSMedicationPrescription.prescriptionItem.validityPeriod",
      "short" : "The period over which the prescription is considered valid and dispensable. validityPeriod.start is, if missing, assumed to be the date of issuance of the prescription.",
      "definition" : "The period over which the prescription is considered valid and dispensable. validityPeriod.start is, if missing, assumed to be the date of issuance of the prescription.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.substitution",
      "path" : "EHDSMedicationPrescription.prescriptionItem.substitution",
      "short" : "Whether and, if so, which type of substitution is allowed, as indicated by the prescriber, for this prescription. The legislation in the country of dispensation applies for performing a substitution.",
      "definition" : "Whether and, if so, which type of substitution is allowed, as indicated by the prescriber, for this prescription. The legislation in the country of dispensation applies for performing a substitution.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.substitution.allowed[x]",
      "path" : "EHDSMedicationPrescription.prescriptionItem.substitution.allowed[x]",
      "short" : "Whether and, if so, to what extent substitution is allowed.",
      "definition" : "Whether and, if so, to what extent substitution is allowed.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      },
      {
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Substance Admin Substitution"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.substitution.reason[x]",
      "path" : "EHDSMedicationPrescription.prescriptionItem.substitution.reason[x]",
      "short" : "Reason for the substitution requirement (e.g. Biological product, Patient allergic to an excipient in alternative products).",
      "definition" : "Reason for the substitution requirement (e.g. Biological product, Patient allergic to an excipient in alternative products).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.numberOfRepeats",
      "path" : "EHDSMedicationPrescription.prescriptionItem.numberOfRepeats",
      "short" : "Number of refills authorised – how many times the prescription item may be dispensed in addition to the original dispensation. If the element is missing, no repeats are authorised.",
      "definition" : "Number of refills authorised – how many times the prescription item may be dispensed in addition to the original dispensation. If the element is missing, no repeats are authorised.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.minimumDispenseInterval",
      "path" : "EHDSMedicationPrescription.prescriptionItem.minimumDispenseInterval",
      "short" : "Minimum dispensation interval. If a prescription allows for repeated dispensations, the interval between dispensations shall be stated here.",
      "definition" : "Minimum dispensation interval. If a prescription allows for repeated dispensations, the interval between dispensations shall be stated here.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.offLabel",
      "path" : "EHDSMedicationPrescription.prescriptionItem.offLabel",
      "short" : "Indicates that the medicinal product is knowingly prescribed for use for an age group, dosage or route of administration not included in the authorised product information.",
      "definition" : "Indicates that the medicinal product is knowingly prescribed for use for an age group, dosage or route of administration not included in the authorised product information.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.offLabel.isOffLabelUse",
      "path" : "EHDSMedicationPrescription.prescriptionItem.offLabel.isOffLabelUse",
      "short" : "Indicates whether the medicinal product is prescribed outside the terms of its marketing authorisation. The value shall be ‘true’ if the medicinal product is prescribed for off-label use and ‘false’ otherwise. Where a reason for off-label use is provided, the value shall be ‘true’.",
      "definition" : "Indicates whether the medicinal product is prescribed outside the terms of its marketing authorisation. The value shall be ‘true’ if the medicinal product is prescribed for off-label use and ‘false’ otherwise. Where a reason for off-label use is provided, the value shall be ‘true’.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.offLabel.reason[x]",
      "path" : "EHDSMedicationPrescription.prescriptionItem.offLabel.reason[x]",
      "short" : "Reason or related clarification for off-label use.",
      "definition" : "Reason or related clarification for off-label use.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      },
      {
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSMedicationPrescription.prescriptionItem.note",
      "path" : "EHDSMedicationPrescription.prescriptionItem.note",
      "short" : "Additional information or comments, e.g. message to the dispenser.",
      "definition" : "Additional information or comments, e.g. message to the dispenser.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
