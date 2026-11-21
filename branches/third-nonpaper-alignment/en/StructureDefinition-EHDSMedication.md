# Medication model - EHDS Logical Information Models v0.3.0

## Logical Model: Medication model 

**Usages:**

* Use this Logical Model: [Immunisation model](StructureDefinition-EHDSImmunisation.md), [Medication administration model](StructureDefinition-EHDSMedicationAdministration.md), [Medication dispense model.](StructureDefinition-EHDSMedicationDispense.md), [Electronic prescription model](StructureDefinition-EHDSMedicationPrescription.md)... Show 2 more, [Medication use model](StructureDefinition-EHDSMedicationUse.md) and [Service request model](StructureDefinition-EHDSServiceRequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSMedication.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSMedication.csv), [Excel](../StructureDefinition-EHDSMedication.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSMedication",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication",
  "version" : "0.3.0",
  "name" : "EHDSMedication",
  "title" : "Medication model",
  "status" : "draft",
  "date" : "2026-11-17T22:01:05+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSMedication means a structured set of data elements describing a medicinal product.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSMedication",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSMedication",
      "path" : "EHDSMedication",
      "short" : "Medication model",
      "definition" : "EHDSMedication means a structured set of data elements describing a medicinal product."
    },
    {
      "id" : "EHDSMedication.identifyingCode",
      "path" : "EHDSMedication.identifyingCode",
      "short" : "An identifier or a code for the product (virtual product, branded product, or package). If several identifiers are specified, they shall not have conflicting meanings or very different granularities. An identifier might not exist e.g. for substance-based prescriptions.",
      "definition" : "An identifier or a code for the product (virtual product, branded product, or package). If several identifiers are specified, they shall not have conflicting meanings or very different granularities. An identifier might not exist e.g. for substance-based prescriptions.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "SNOMED GPS, EMA PMS ID or a national coding system"
      }
    },
    {
      "id" : "EHDSMedication.classification",
      "path" : "EHDSMedication.classification",
      "short" : "Anatomical therapeutic chemical classification or another classification (e.g. narcotic/psychotropic; orphan drug).",
      "definition" : "Anatomical therapeutic chemical classification or another classification (e.g. narcotic/psychotropic; orphan drug).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "WHO ATC, non-binding coding systems for other classifications"
      }
    },
    {
      "id" : "EHDSMedication.productName",
      "path" : "EHDSMedication.productName",
      "short" : "Current trade name (authorised name) of the product. When medication is specified by a CodeableConcept, the name may be omitted when available as the display name of the concept.",
      "definition" : "Current trade name (authorised name) of the product. When medication is specified by a CodeableConcept, the name may be omitted when available as the display name of the concept.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSMedication.marketingAuthorisationHolder",
      "path" : "EHDSMedication.marketingAuthorisationHolder",
      "short" : "Marketing authorisation holder of the medicinal product. Relevant for identifying the exact medicinal product. If the medicinal product does not have a marketing authorisation, the manufacturer information may be used.",
      "definition" : "Marketing authorisation holder of the medicinal product. Relevant for identifying the exact medicinal product. If the medicinal product does not have a marketing authorisation, the manufacturer information may be used.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.marketingAuthorisationHolder.organisationName",
      "path" : "EHDSMedication.marketingAuthorisationHolder.organisationName",
      "short" : "Name of the organisation holding the authorisation for marketing/manufacturing.",
      "definition" : "Name of the organisation holding the authorisation for marketing/manufacturing.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSMedication.marketingAuthorisationHolder.organisationIdentifier",
      "path" : "EHDSMedication.marketingAuthorisationHolder.organisationIdentifier",
      "short" : "Identifier of the organisation and/or its physical location.",
      "definition" : "Identifier of the organisation and/or its physical location.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSMedication.doseForm",
      "path" : "EHDSMedication.doseForm",
      "short" : "Dose form at the package level (e.g. authorised dose form), corresponding to IDMP Combined Pharmaceutical Dose Form (this includes terms from EDQM Combination Pack or Combined Dose Form lists). Dose form for a single package item is defined in item.doseForm.",
      "definition" : "Dose form at the package level (e.g. authorised dose form), corresponding to IDMP Combined Pharmaceutical Dose Form (this includes terms from EDQM Combination Pack or Combined Dose Form lists). Dose form for a single package item is defined in item.doseForm.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EDQM Standard Terms"
      }
    },
    {
      "id" : "EHDSMedication.description",
      "path" : "EHDSMedication.description",
      "short" : "Textual description of the product, e.g. including package description.",
      "definition" : "Textual description of the product, e.g. including package description.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSMedication.item",
      "path" : "EHDSMedication.item",
      "short" : "A medication item. For combination packs, this can be multiple manufactured items with each item having its own dose form and ingredients+strengths defined.",
      "definition" : "A medication item. For combination packs, this can be multiple manufactured items with each item having its own dose form and ingredients+strengths defined.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.item.doseForm",
      "path" : "EHDSMedication.item.doseForm",
      "short" : "Administrable or manufactured item dose form, depending on the type of medication definition. This should not include combined dose forms.",
      "definition" : "Administrable or manufactured item dose form, depending on the type of medication definition. This should not include combined dose forms.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EDQM Standard Terms"
      }
    },
    {
      "id" : "EHDSMedication.item.ingredient",
      "path" : "EHDSMedication.item.ingredient",
      "short" : "Ingredients.",
      "definition" : "Ingredients.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.item.ingredient.isActive",
      "path" : "EHDSMedication.item.ingredient.isActive",
      "short" : "Marks whether the substance is considered an active substance. Excipients are typically not needed, and by default only active ingredients are expected.",
      "definition" : "Marks whether the substance is considered an active substance. Excipients are typically not needed, and by default only active ingredients are expected.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "EHDSMedication.item.ingredient.substance",
      "path" : "EHDSMedication.item.ingredient.substance",
      "short" : "Substance.",
      "definition" : "Substance.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EMA SPOR SMS"
      }
    },
    {
      "id" : "EHDSMedication.item.ingredient.strengthInfo",
      "path" : "EHDSMedication.item.ingredient.strengthInfo",
      "short" : "Amount of active substance per unit.",
      "definition" : "Amount of active substance per unit.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.item.ingredient.strengthInfo.strength[x]",
      "path" : "EHDSMedication.item.ingredient.strengthInfo.strength[x]",
      "short" : "Concentration or presentation strength, e.g '100 mg/1 ml' or '500 mg per 1 tablet'.",
      "definition" : "Concentration or presentation strength, e.g '100 mg/1 ml' or '500 mg per 1 tablet'.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      },
      {
        "code" : "string"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measure / EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedication.item.ingredient.strengthInfo.basisOfStrengthSubstance",
      "path" : "EHDSMedication.item.ingredient.strengthInfo.basisOfStrengthSubstance",
      "short" : "Active substance that the strength refers to, especially when different from .item.strength.substance.",
      "definition" : "Active substance that the strength refers to, especially when different from .item.strength.substance.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EMA SPOR SMS"
      }
    },
    {
      "id" : "EHDSMedication.item.unitOfPresentation",
      "path" : "EHDSMedication.item.unitOfPresentation",
      "short" : "Unit of presentation for the medicinal product (tablet, vial, tube). Typically, the smallest countable object in the package.",
      "definition" : "Unit of presentation for the medicinal product (tablet, vial, tube). Typically, the smallest countable object in the package.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedication.item.containedQuantity",
      "path" : "EHDSMedication.item.containedQuantity",
      "short" : "Packaged item quantity per one item (3 ml / 1 vial)",
      "definition" : "Packaged item quantity per one item (3 ml / 1 vial)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }]
    },
    {
      "id" : "EHDSMedication.item.containedQuantity.numerator",
      "path" : "EHDSMedication.item.containedQuantity.numerator",
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measure / EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedication.item.containedQuantity.denominator",
      "path" : "EHDSMedication.item.containedQuantity.denominator",
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measure / EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedication.item.amount",
      "path" : "EHDSMedication.item.amount",
      "short" : "Number of such items in this medicinal product (e.g. 5 vials in the package). The combined amount of all items will be considered to be the total package size.",
      "definition" : "Number of such items in this medicinal product (e.g. 5 vials in the package). The combined amount of all items will be considered to be the total package size.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measure / EDQM Standard Terms for units of presentation"
      }
    },
    {
      "id" : "EHDSMedication.item.packageType",
      "path" : "EHDSMedication.item.packageType",
      "short" : "Type of package of the medicinal product item.",
      "definition" : "Type of package of the medicinal product item.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EDQM Standard Terms for packaging"
      }
    },
    {
      "id" : "EHDSMedication.device",
      "path" : "EHDSMedication.device",
      "short" : "Administration device included in the medicinal product. Devices that are not inside the package of medicinal product are excluded.",
      "definition" : "Administration device included in the medicinal product. Devices that are not inside the package of medicinal product are excluded.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.device.deviceQuantity",
      "path" : "EHDSMedication.device.deviceQuantity",
      "short" : "Number of devices.",
      "definition" : "Number of devices.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "EHDSMedication.device.device",
      "path" : "EHDSMedication.device.device",
      "short" : "Device coded.",
      "definition" : "Device coded.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "EDQM Standard Terms"
      }
    },
    {
      "id" : "EHDSMedication.characteristic",
      "path" : "EHDSMedication.characteristic",
      "short" : "Additional features of the medicinal product (e.g. reimbursable, sugar-free, easy-open cap, score-lined). It is expected that implementers will define a value set supporting their use cases.",
      "definition" : "Additional features of the medicinal product (e.g. reimbursable, sugar-free, easy-open cap, score-lined). It is expected that implementers will define a value set supporting their use cases.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.characteristic.type",
      "path" : "EHDSMedication.characteristic.type",
      "short" : "A code expressing the type of characteristic.",
      "definition" : "A code expressing the type of characteristic.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Not defined"
      }
    },
    {
      "id" : "EHDSMedication.characteristic.value[x]",
      "path" : "EHDSMedication.characteristic.value[x]",
      "short" : "Description of the characteristic value.",
      "definition" : "Description of the characteristic value.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      },
      {
        "code" : "Quantity"
      },
      {
        "code" : "dateTime"
      },
      {
        "code" : "integer"
      },
      {
        "code" : "decimal"
      },
      {
        "code" : "Ratio"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "UCUM for units of measure"
      }
    },
    {
      "id" : "EHDSMedication.batch",
      "path" : "EHDSMedication.batch",
      "short" : "Batch information of a medicinal product. Typically recorded during dispense or administration, rarely known or relevant for a prescription/request.",
      "definition" : "Batch information of a medicinal product. Typically recorded during dispense or administration, rarely known or relevant for a prescription/request.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "EHDSMedication.batch.lotNumber",
      "path" : "EHDSMedication.batch.lotNumber",
      "short" : "Batch identifier of the medicinal product.",
      "definition" : "Batch identifier of the medicinal product.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "EHDSMedication.batch.expirationDate",
      "path" : "EHDSMedication.batch.expirationDate",
      "short" : "Batch expiration date of the medicinal product.",
      "definition" : "Batch expiration date of the medicinal product.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
