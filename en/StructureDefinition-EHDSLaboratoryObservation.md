# Model for observation performed by laboratory - EHDS Logical Information Models v0.3.0

## Logical Model: Model for observation performed by laboratory 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md), [Model for observation performed by laboratory](StructureDefinition-EHDSLaboratoryObservation.md), [Medical test result and report model](StructureDefinition-EHDSMedicalTestReport.md) and [Observation model](StructureDefinition-EHDSObservation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSLaboratoryObservation.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSLaboratoryObservation.csv), [Excel](../StructureDefinition-EHDSLaboratoryObservation.xlsx) 

### Notes:

#### When to use components

##### Semantic meaning of components

A **component** represents a structured sub-result that:

* is measured together with other components,
* shares the same observation context, and
* is not clinically meaningful on its own.

Components answer the question:

> **“What are the parts of this one observation?”**

All components share the same:

* subject,
* time of observation,
* performer,
* method.

Components:

* cannot stand alone without the parent observation, and
* are usually presented together.

##### Guidance for use

Use **components** if **all** of the following are true:

* the values are observed at the same moment,
* they are produced by the same observation act,
* they are meaningless or potentially misleading in isolation, and
* they are not expected to be referenced independently.

#### When to use relationships between observations

##### Semantic meaning of relationships

The Observation model allows observations to be related using the following relationship types:

* **hasMember** – to group multiple observations that belong to a common set or panel,
* **derivedFrom** – to indicate that one observation is calculated, inferred, or otherwise derived from one or more other observations,
* **triggeredBy** – to indicate that one observation was initiated or caused by another observation or event.

Each related observation:

* has independent clinical meaning,
* may be observed or reported separately, and
* may be reused or referenced independently.

##### Guidance for use

Use **relationships between observations** when the related observations:

* have independent meaning,
* may have different observation times,
* may have different performers or methods, and
* can be referenced, queried, or interpreted independently.

#### Summary principles

* Use **components** when the parts are inseparable aspects of a single observation.
* Use **relationships between observations** when each observation has independent clinical meaning.



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSLaboratoryObservation",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLaboratoryObservation",
  "version" : "0.3.0",
  "name" : "EHDSLaboratoryObservation",
  "title" : "Model for observation performed by laboratory",
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
  "description" : "Model for observation performed by laboratory.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLaboratoryObservation",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSLaboratoryObservation",
      "path" : "EHDSLaboratoryObservation",
      "short" : "Model for observation performed by laboratory",
      "definition" : "Model for observation performed by laboratory."
    },
    {
      "id" : "EHDSLaboratoryObservation.header.directSubject[x]",
      "path" : "EHDSLaboratoryObservation.header.directSubject[x]",
      "short" : "The direct subject of the observation if different from the patient (subject of care), e.g. an implanted device, a location or another person."
    },
    {
      "id" : "EHDSLaboratoryObservation.type",
      "path" : "EHDSLaboratoryObservation.type",
      "short" : "Observation type."
    },
    {
      "id" : "EHDSLaboratoryObservation.result.uncertainty",
      "path" : "EHDSLaboratoryObservation.result.uncertainty",
      "short" : "Measurement uncertainty information about the observation result."
    },
    {
      "id" : "EHDSLaboratoryObservation.result.uncertainty.type",
      "path" : "EHDSLaboratoryObservation.result.uncertainty.type",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Probability Distribution Type"
      }
    },
    {
      "id" : "EHDSLaboratoryObservation.result.dataAbsentReason",
      "path" : "EHDSLaboratoryObservation.result.dataAbsentReason",
      "short" : "Provides a reason why the expected value in the element LaboratoryObservation.result.value[x] is missing."
    },
    {
      "id" : "EHDSLaboratoryObservation.referenceRange.appliesTo",
      "path" : "EHDSLaboratoryObservation.referenceRange.appliesTo",
      "short" : "Codes to indicate the target population this reference range applies to."
    },
    {
      "id" : "EHDSLaboratoryObservation.component.type",
      "path" : "EHDSLaboratoryObservation.component.type",
      "short" : "Type of component observation."
    },
    {
      "id" : "EHDSLaboratoryObservation.component.result",
      "path" : "EHDSLaboratoryObservation.component.result",
      "short" : "Result of the observation including text, numeric, coded and other types of results of the measurement and measurement uncertainty. Content of the observation result may vary depending on the type of observation."
    },
    {
      "id" : "EHDSLaboratoryObservation.component.result.uncertainty",
      "path" : "EHDSLaboratoryObservation.component.result.uncertainty",
      "short" : "Measurement uncertainty information about the observation result."
    },
    {
      "id" : "EHDSLaboratoryObservation.component.result.uncertainty.type",
      "path" : "EHDSLaboratoryObservation.component.result.uncertainty.type",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Probability Distribution Type"
      }
    },
    {
      "id" : "EHDSLaboratoryObservation.component.referenceRange.appliesTo",
      "path" : "EHDSLaboratoryObservation.component.referenceRange.appliesTo",
      "short" : "Codes to indicate the target population this reference range applies to."
    },
    {
      "id" : "EHDSLaboratoryObservation.triggeredBy[x]",
      "path" : "EHDSLaboratoryObservation.triggeredBy[x]",
      "short" : "References to the observation that triggered the performance of this observation.",
      "definition" : "References to the observation that triggered the performance of this observation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLaboratoryObservation"
      },
      {
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSObservation"
      }]
    },
    {
      "id" : "EHDSLaboratoryObservation.testKit",
      "path" : "EHDSLaboratoryObservation.testKit",
      "short" : "Laboratory test kit used during measurement.",
      "definition" : "Laboratory test kit used during measurement.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDevice"
      }]
    },
    {
      "id" : "EHDSLaboratoryObservation.calibrator",
      "path" : "EHDSLaboratoryObservation.calibrator",
      "short" : "Information about which end-user calibrator the laboratory used for the measurement to indicate the metrological traceability chain.",
      "definition" : "Information about which end-user calibrator the laboratory used for the measurement to indicate the metrological traceability chain.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "EHDSLaboratoryObservation.accreditationStatus",
      "path" : "EHDSLaboratoryObservation.accreditationStatus",
      "short" : "Accreditation status of the laboratory for the observation.",
      "definition" : "Accreditation status of the laboratory for the observation.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "EHDSLaboratoryObservation.previousResults",
      "path" : "EHDSLaboratoryObservation.previousResults",
      "short" : "Previous results of the same observation",
      "definition" : "Previous results of the same observation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSLaboratoryObservation"
      }]
    },
    {
      "id" : "EHDSLaboratoryObservation.pointOfCareTest",
      "path" : "EHDSLaboratoryObservation.pointOfCareTest",
      "short" : "Examination performed near or at the site of a patient.",
      "definition" : "Examination performed near or at the site of a patient.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
