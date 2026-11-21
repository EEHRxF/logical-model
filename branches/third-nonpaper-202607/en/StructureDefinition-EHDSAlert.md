# Alert model - EHDS Logical Information Models v0.3.0

## Logical Model: Alert model 

 
EHDSAlert means a structured set of data elements describing a clinically relevant fact about a patient that requires attention during a healthcare encounter in order to ensure patient safety or prevent adverse outcomes, including, but not limited to, intolerances, rare diseases requiring special management, implanted devices, ongoing special treatments, transplanted organs, or participation in a clinical trial. 

**Usages:**

* Use this Logical Model: [Discharge report model](StructureDefinition-EHDSDischargeReport.md) and [Patient summary model](StructureDefinition-EHDSPatientSummary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/eu.ehds.models|current/StructureDefinition/StructureDefinition-EHDSAlert.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EHDSAlert.csv), [Excel](../StructureDefinition-EHDSAlert.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EHDSAlert",
  "url" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAlert",
  "version" : "0.3.0",
  "name" : "EHDSAlert",
  "title" : "Alert model",
  "status" : "draft",
  "date" : "2026-09-10T07:52:32+00:00",
  "publisher" : "EC",
  "contact" : [{
    "name" : "EC",
    "telecom" : [{
      "system" : "url",
      "value" : "http://commission.europa.eu/"
    }]
  }],
  "description" : "EHDSAlert means a structured set of data elements describing a clinically relevant fact about a patient that requires attention during a healthcare encounter in order to ensure patient safety or prevent adverse outcomes, including, but not limited to, intolerances, rare diseases requiring special management, implanted devices, ongoing special treatments, transplanted organs, or participation in a clinical trial.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSAlert",
  "baseDefinition" : "http://ehds.eu/fhir/models/StructureDefinition/EHDSDataSet",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EHDSAlert",
      "path" : "EHDSAlert",
      "short" : "Alert model",
      "definition" : "EHDSAlert means a structured set of data elements describing a clinically relevant fact about a patient that requires attention during a healthcare encounter in order to ensure patient safety or prevent adverse outcomes, including, but not limited to, intolerances, rare diseases requiring special management, implanted devices, ongoing special treatments, transplanted organs, or participation in a clinical trial."
    },
    {
      "id" : "EHDSAlert.header.author[x]",
      "path" : "EHDSAlert.header.author[x]",
      "definition" : "The author of the alert statement, i.e. the setter of the alert."
    },
    {
      "id" : "EHDSAlert.header.status",
      "path" : "EHDSAlert.header.status",
      "short" : "Current status of the alert.",
      "definition" : "Current status of the alert, indicates whether this alert is active and needs to be displayed to a user, or whether it is no longer needed.",
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Flag Status"
      }
    },
    {
      "id" : "EHDSAlert.code",
      "path" : "EHDSAlert.code",
      "short" : "A coded representation of the alert.",
      "definition" : "A coded representation of the alert.",
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
      "id" : "EHDSAlert.description",
      "path" : "EHDSAlert.description",
      "short" : "Narrative representation of the alert.",
      "definition" : "Narrative representation of the alert.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Narrative"
      }]
    },
    {
      "id" : "EHDSAlert.priority",
      "path" : "EHDSAlert.priority",
      "short" : "A code that identifies the priority of the alert.",
      "definition" : "A code that identifies the priority of the alert.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "HL7 Flag Priority Codes"
      }
    },
    {
      "id" : "EHDSAlert.period",
      "path" : "EHDSAlert.period",
      "short" : "Time period when alert is active. The period of time from the activation of the alert to inactivation of the alert. If the alert is active, the end of the period should be unspecified.",
      "definition" : "Time period when alert is active. The period of time from the activation of the alert to inactivation of the alert. If the alert is active, the end of the period should be unspecified.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    }]
  }
}

```
