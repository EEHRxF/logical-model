Logical: EHDSAdministeredDosage
Parent: EHDSDosage
Title: "Administered dosage model"
Description: """EHDSAdministeredDosage means the structured set of data elements describing a single instance of medication administration, including the dose given, the route and method of administration, and the time of administration."""

* dosageDetails 0..1
  * doseAndRate 0..*
  * doseAndRate ^short = "Amount of medication administered per one dose (= one timing)."
    * dose[x] ^short = "Amount of medication per one dose (1 tablet, 2-3 tablets, 20ml)."
       //* insert Full(#SHOULD)
    * rate[x] ^short = "Amount of medication per time period (e.g. 100mg per 1 hour). When rate is provided per 1 time unit, Quantity data type can be used with a suitable unit (e.g. mg/h, ug/min)."
  * sequence 0..0
  * repeat 0..0
  * asNeeded 0..0

// Obligations propagated from parent models.
/* * dosageDetails
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails.bodySite
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails.doseAndRate
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails.doseAndRate.dose[x]
  // from EHDSDosage
   //* insert Basic(#SHOULD)
* dosageDetails.doseAndRate.rate[x]
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails.note
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails.routeOfAdministration
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* renderedDosageInstruction
  // from EHDSDosage
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
// End of obligations propagated from parent models.
 */