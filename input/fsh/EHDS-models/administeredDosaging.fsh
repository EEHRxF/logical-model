Logical: EHDSAdministeredDosage
Parent: EHDSDosage
Title: "Administered dosage model"
Description: """EHDSAdministeredDosage means the structured set of data elements describing a single instance of medication administration, including the dose given, the route and method of administration, and the time of administration."""

* dosageDetails 0..1
  // Aurora, finding 26: both parent and derived model allow repeated dose-and-rate entries.
  * doseAndRate 0..*
  * doseAndRate ^short = "Amount of medication administered per dose (= one timing)."
    * dose[x] ^short = "Amount of medication per dose (1 tablet, 23 tablets, 20 ml)."
       //* insert Full(#SHOULD)
    * rate[x] ^short = "Amount of medication per time period (e.g. 100 mg per hour). When rate is provided per time unit, Quantity data type may be used with a suitable unit (e.g. mg/h, μg/min.)."
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

// Element descriptions aligned with WP v5.
* renderedDosageInstruction ^short = "Full dosage information as human-readable text covering all dosage steps. Generating the text follows local rules and shall include all locally implemented dosage data even when such elements are not present in this model."
