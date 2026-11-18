Logical: EHDSDosage
Title: "Dosage model"
Description: "EHDSDosage means a structured set of data elements describing the instructions for administering a medicinal product."

* renderedDosageInstruction 0..1 string "Full dosage information as human-readable text covering all dosage steps. Generating the text shall follow local rules and shall include all locally implemented dosage data even when such elements are not present in this model."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* dosageDetails 0..* Base "Details of the step in a single dosage scheme."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * sequence 0..1 integer "Order of the dosage instruction, if one treatment consists of several dosage steps. When two schemes share the same sequence number, they are meant to run in parallel."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * note 0..1 string "Patient-oriented instructions as free text for this dosage step."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * doseAndRate 0..1 Base "Amount of medicinal product administered per dose (= one timing)."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * dose[x] 0..1 Quantity or Range "Amount of medicinal product per one dose (1 tablet, 2-3 tablets, 20 ml)."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM (units of measurement), EDQM Standard Terms (units of presentation)"
      * ^binding.strength = #required
    * rate[x] 0..1 Quantity or Ratio "Amount of medicinal product per time period (e.g. 100 mg per hour). When rate is provided per time unit, Quantity data type may be used with a suitable unit (e.g. mg/h, μg/min.)."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM (units of measurement), EDQM Standard Terms (units of presentation)"
      * ^binding.strength = #required
  * repeat 0..1 Base "Repetition of the administration."
     //* insert Full(#SHALL)
     //* insert Basic(#SHOULD)
    * bounds[x] 0..1 Quantity or Period "Time bounds for the treatment (current dosage scheme), Quantity contains a number of time units (e.g. 10 days), Period contains start and end date (e.g. 5.8.2023-10.8.2023)."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
    * duration 0..1 Quantity "Duration of administration (e.g. ‘five minutes’, ‘one hour’)."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "UCUM (units of measurement)"
      * ^binding.strength = #required
    * frequency 0..1 Base "Frequency of intake/administration."
       //* insert Full(#SHALL)
       //* insert Basic(#SHOULD)
      * numberOfTimes 0..1 integer "Number of times per period (e.g. ‘three times’)."
         //* insert Full(#SHALL)
         //* insert Basic(#SHOULD)
      * period 0..1 Quantity "Duration to which the frequency applies (e.g. ‘… / one day’)."
         //* insert Full(#SHALL)
         //* insert Basic(#SHOULD)
        * ^binding.description = "UCUM (units of measurement)"
        * ^binding.strength = #required
    * dayOfWeek 0..* CodeableConcept "The day of the week of administration, e.g. Mon., Tue."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "HL7 Days Of Week"
      * ^binding.strength = #required
    * timeOfDay 0..* time "Exact time of day of administration (e.g. ‘10:00’)."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
    * eventTime 0..* CodeableConcept "Time period or event when the administration shall happen (‘before meal’, ‘immediately’, ‘morning’)."
       //* insert Full(#SHOULD)
       //* insert Basic(#SHOULD)
      * ^binding.description = "HL7 Event Timing"
      * ^binding.strength = #required
  * asNeeded 0..1 boolean "Take as needed."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * bodySite 0..1 EHDSBodyStructure "Body site of administration."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
  * routeOfAdministration 0..1 CodeableConcept "Route of administration."
     //* insert Full(#SHOULD)
     //* insert Basic(#SHOULD)
    * ^binding.description = "EDQM Standard Terms"
    * ^binding.strength = #required
