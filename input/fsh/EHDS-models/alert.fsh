Logical: EHDSAlert
Parent: EHDSDataSet
Title: "Alert model"
Description: """EHDSAlert means a structured set of data elements describing a clinically relevant fact about a patient that requires attention during a healthcare encounter in order to ensure patient safety or prevent adverse outcomes, including, but not limited to, intolerances, rare diseases requiring special management, implanted devices, ongoing special treatments, transplanted organs, or participation in a clinical trial."""

* header
  * author[x]
    * ^definition = "Author of the resource."

  * subject
     //* insert Basic(#SHOULD)
   //* patientInsertedData
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * status
    * ^short = "Current status of the alert."
    * ^definition = "Current status of the alert."
    * ^binding.description = "HL7 Flag Status"
    * ^binding.strength = #required

* code 0..1 CodeableConcept "A coded representation of the alert."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
  * ^binding.description = "SNOMED GPS"
  * ^binding.strength = #required
* description 0..1 Narrative "Narrative representation of the alert."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* priority 0..1 CodeableConcept "A code that identifies the priority of the alert."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "HL7 Flag Priority Codes"
  * ^binding.strength = #required
* period 0..1 Period "Time period when alert is active. The period of time from activation of the alert to inactivation of the alert. If the alert is active, the end of the period shall not be specified."
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* sourceReference 0..* uri "A reference to the resource the alert is about."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)

// Obligations propagated from parent models.
* header
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* header.author[x]
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.date
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.identifier
  // from EHDSDataSet
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* header.status
  // from EHDSDataSet
   //* insert Full(#SHALL)
   //* insert Basic(#SHOULD)
* header.subject
  // from EHDSDataSet
   //* insert Full(#SHALL)
// End of obligations propagated from parent models.

// Element descriptions aligned with WP v5.
* header.identifier ^short = "Business identifier for the object, unique within its system. Supporting disambiguation between different contexts (systems/countries)."
