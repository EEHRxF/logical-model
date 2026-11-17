# Comparison of the generated tables with Non-paper v3

Comparison date: 17 November 2026.

## Sources and scope

- WP: [Non-paper v3 on EHDS Article 15_issues.docx](<Non-paper v3 on EHDS Article 15_issues.docx>), the locally saved version with the additional comments.
- Export: [out/logical-models.docx](../out/logical-models.docx), all 42 logical model tables, regenerated after compiling the current FSH sources with SUSHI.
- Supplementary source: the [data type table](../input/pagecontent/datatypes.md), which is not part of the Word export above.

This comparison covers table contents, excluding the articles and other WP text. The common metadata in Annex II are compared with the EHDSDocument header. The technical representation table in Annex I has no counterpart in the logical model Word export and is not treated as missing model content. Names, hierarchy, descriptions, types, cardinalities and terminology bindings are considered. Simple differences in whitespace, punctuation, quotation marks, capitalisation and list separators are not treated as substantive discrepancies. A different order of terminologies without an explicit preference is not treated as a different binding.

Prohibited elements with a maximum cardinality of 0 and their descendants are no longer exported. The earlier differences caused by rendering them have been resolved.

Items 1–31 retain their previous numbers so existing references remain valid. Items 8, 9, 14, 30 and 31 are now resolved. Item 24 has moved from Observation to LaboratoryObservation, and item 32 records a newly identified documentation formatting issue. Comment IDs have been refreshed from the current WP file; IDs from earlier versions must not be reused. The complete current comments and their selected text are included in the appendix.

## Refresh validation

The current FSH sources were compiled with SUSHI 3.21.0 before regenerating the tables. SUSHI reported 0 errors and 4 warnings: the version check could not reach the registry, and the automatically provided tools, terminology and extensions packages could not be loaded. The cached FHIR R5 core package was loaded successfully, and all 42 logical models were exported. This refresh does not constitute a full IG Publisher build.

## Differences

1. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — language requirement.** Annex II of the WP specifies cardinality `1..1` for `language`; the export has `0..1`. The other document tables in the WP also use `0..1`.

   **PROPOSED WP CHANGE — comment 7:** “Inconsistent cardinality. 0..1 in derived models!” The comment explicitly identifies an internal inconsistency in the WP; the export matches the derived tables.

2. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — incomplete common metadata in Annex II.** Annex II omits `date` (`dateTime`, `1..1`) and `countryOfOrigin` (`CodeableConcept`, `0..1`), both present in the export. The `status` row has no data type; the export specifies `CodeableConcept`.

   **PROPOSED WP CHANGE — comment 2 on the table title:** identifies the missing `header.date` and `header.countryOfOrigin` compared with the priority categories. **Comment 6 directly on `status`:** “Data type CodeableConcept is missing.” All three parts of this item are therefore covered by WP comments, and the export matches them.

3. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — scope of metadata descriptions.** Annex II describes `author[x]`, `status`, `language` and `custodian` in terms of a document or resource; the export uses narrower wording referring only to a document or only to a resource. For the author, the WP says “Information describing who authored the resource or document.”, while the export says “Author of the document.”

   **No comment proposing this WP change was found.** Comments 6 and 7 on the same rows concern the type and cardinality, rather than the descriptions.

4. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — legal authentication descriptions in Annex II.** The WP describes `legalAuthenticator[x]` as a person; the export describes a person or organisation. Both sources allow EHDSHealthProfessional and EHDSOrganisation. For the legal authentication time, the WP uses “authorised” and the export uses “authenticated”.

   **PROPOSED WP CHANGE — comment 3:** explicitly requests “person or organisation”; the export matches this proposal. **Comments 5, 9, 17, 27 and 31** ask whether “authorised” or “authenticated” should be used across the metadata and document tables. **Comment 45** on EHDSDocument proposes “authorised”; the export currently retains “authenticated”. The terminology question therefore remains open, and the export does not implement comment 45.

5. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) and derived documents — `lastUpdate`.** The export also includes `header.lastUpdate` in the EHDSDocument, EHDSPatientSummary, EHDSImagingReport, EHDSMedicalTestReport and EHDSDischargeReport tables. The WP includes it only in the common metadata in Annex II, rather than in these repeated tables.

   **No comment proposing this WP change was found.** This is an inconsistency between the common metadata and the repeated WP tables; the field is already present in the model.

6. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) and derived documents — extended legal authentication descriptions.** The export inherits the extended explanation of legal authentication requirements and the roles of author, attester and authenticator. Annex II of the WP contains these explanations, but some other WP tables retain the shorter original descriptions. This particularly concerns EHDSDocument, EHDSPatientSummary, EHDSMedicalTestReport, EHDSDischargeReport and the authenticator description in EHDSImagingReport.

   **No comment proposing alignment of the repeated WP descriptions was found.** The export reflects the Annex II text here.

7. **[EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — author element name.** The WP uses `header.author`; the export uses `header.author[x]`. The EHDSHealthProfessional type and cardinality `1..*` match. The WP describes the document author; the export describes the resource author.

   **PROPOSED WP CHANGE — comment 11:** requires `author[x]` because the element is inherited from EHDSDataSet. The exported name matches the proposal; the comment does not address the different description wording.

8. **[EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — `prescriptionItem.status` binding: RESOLVED.** Both the regenerated export and the WP now specify `HL7 Medication Request Status`. The previously reported binding difference no longer exists.

9. **[EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — `prescriptionItem.statusReason[x]` binding: RESOLVED.** Both the regenerated export and the WP now specify `Not defined`. The previously reported binding difference no longer exists.

10. **[EHDSDocument](../input/fsh/EHDS-models/document.fsh), [EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh), [EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — `datetime` versus `dateTime`.** The WP uses `header.attestation.datetime` in the Document and ImagingReport tables and `header.legalAuthentication.datetime` in the DischargeReport table. The export uses `dateTime`.

    **PROPOSED WP CHANGE — comments 14–15, 29–30 and 43–44:** propose the more common name `dateTime` and include replies agreeing with the change. The export matches these proposals.

11. **[EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) — result element name.** The WP uses `body.examinationReport.results[x]`; the export uses `body.examinationReport.result[x]`.

    **PROPOSED WP CHANGE — comments 21–22:** request the singular name `result[x]` and confirm agreement. The export matches the proposal.

12. **[EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh), [EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — `presentedForm` data type.** The WP leaves the type cell blank; the export specifies EHDSAttachment.

    **PROPOSED WP CHANGE — comments 19 and 25:** both explicitly require EHDSAttachment. The export matches the proposals.

13. **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — key image identifiers.** The export additionally includes `series.instanceInTheSeries.keyImage.seriesUID` and `instanceUID`, both of type Identifier with cardinality `1..*`.

    **PROPOSED WP CHANGE — comment 26 on `keyImage`:** requests both identifying elements with the same cardinalities and descriptions. The export matches the proposal.

14. **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — opening of the status description: RESOLVED.** The regenerated export now includes “Status of the resource.” Both this sentence and the subsequent conditions for `unknown` and `available` match the WP.

15. **[EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — model name.** The WP uses `DischargeReport`; the export uses `EHDSDischargeReport`.

    **PROPOSED WP CHANGE — comment 28:** requires EHDSDischargeReport for consistency. The export matches the proposal.

16. **[EHDSAlert](../input/fsh/EHDS-models/alert.fsh) — more detailed author and status descriptions.** For `header.author[x]`, the export explains that this is the person setting the alert; for `header.status`, it explains the meaning of activity and the need to display the alert. The WP contains only shorter generic descriptions.

    **No comment proposing this WP change was found.** Types, cardinalities and bindings match.

17. **[EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) — `duration` hierarchy.** The WP specifies level `++++`, corresponding to `dosageDetails.repeat.bounds[x].duration`. The export has level `+++`, corresponding to `dosageDetails.repeat.duration`.

    **PROPOSED WP CHANGE — comment 49 on level `++++`:** “Shall be one level down!” The comment identifies a need to change the level. Its wording alone does not unambiguously specify the direction of nesting; the levels are therefore stated explicitly above.

18. **[EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) — mention of Range in `bounds[x]`.** The WP description additionally contains “, Range”. However, its type column includes only Quantity and Period, matching the export.

    **PROPOSED WP CHANGE — comment 46:** “Shall be removed. Typo?” The export already omits this reference and matches the proposal. Comments 47–48 on the same row concern UCUM wording and the binding within Quantity; they should not be confused with the proposal concerning Range.

19. **[EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — location of the `item.containedQuantity` binding.** The WP specifies UCUM/EDQM directly on the Ratio field. The export specifies bindings on separate `numerator` and `denominator` rows; the WP does not contain these rows.

    **COMMENT SUPPORTING THE MODEL APPROACH — comment 54:** explains the FHIR/QA limitation and the introduction of these two child rows in the logical model. It explains the reason for the difference but does not explicitly instruct how to change the WP table.

20. **[EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — units for `device.deviceQuantity`.** The WP specifies a UCUM binding on an integer type; the export has no binding.

    **PROPOSED WP CHANGE — comments 55–56:** note that integer has no place for a unit and explicitly propose removing the binding. The export matches the proposal.

21. **[EHDSMedicationUse](../input/fsh/EHDS-models/medicationUse.fsh) — `derivedFrom[x]`.** The WP allows EHDSMedication; the export allows EHDSMedicationDispense instead. The other types match.

    **PROPOSED WP CHANGE — comments 57–58:** propose EHDSMedicationDispense and confirm that the model already uses it. The export matches the proposal.

22. **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh) — `header.directSubject[x]`.** The export additionally allows EHDSProcedure. The Observation table in the WP omits it, while the LaboratoryObservation table allows it.

    **PROPOSED WP CHANGE — comment 59:** requests adding EHDSProcedure to the parent Observation model as well. The export matches the proposal.

23. **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh) — `component.result`, certainty versus uncertainty.** The WP uses “measurement certainty”; the export uses “measurement uncertainty”. The export matches the LaboratoryObservation table in the WP.

    **PROPOSED WP CHANGE — comment 62:** “should be measurement uncertainty to match with element name.” The export matches this proposal. The two WP tables are internally inconsistent.

24. **[EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — descriptions of `result.uncertainty` and `component.result.uncertainty`: DIFFERENCE MOVED.** The regenerated export inherits “Measurement uncertainty information type and interval if needed about the observation result.” This now matches the Observation table in the WP, resolving the former Observation discrepancy. However, the LaboratoryObservation table in the WP still uses the shorter “Measurement uncertainty information about the observation result.” for both fields, so a difference remains for LaboratoryObservation.

    **PROPOSED WP CHANGE — comments 50–51:** explicitly request the same longer descriptions as EHDSObservation. The regenerated export matches both proposals. The two WP tables remain internally inconsistent. This item now identifies the LaboratoryObservation discrepancy rather than the previous Observation discrepancy.

25. **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh) — uncertainty type and binding names.** The WP does not specify a data type for `result.uncertainty.type`; the export specifies CodeableConcept. For this field and `component.result.uncertainty.type`, the WP uses the binding name “HL7 ProbabilityDistributionType”; the export uses “HL7 Probability Distribution Type”. The LaboratoryObservation table in the WP matches the export.

    **PROPOSED WP CHANGE — comment 61:** “Shall be CodeableConcept.” The proposal covers adding the data type, rather than the different spelling of the binding name. No separate proposal was found for the binding names.

26. **[EHDSProcedure](../input/fsh/EHDS-models/procedure.fsh) — representation of `reason[x]`.** The WP lists four alternatives as separate child rows. The export lists the types directly on `reason[x]`, with the binding on the same row. The allowed types match.

    **PROPOSED WP CHANGE — comments 63–64:** the first explains the separation of alternatives into rows, but the new reply explicitly proposes “reason[x] with mutliple data types”. The export therefore matches the newly added proposal; this is no longer merely an explanatory note as it was in the original WP version.

27. **[EHDSTravelHistory](../input/fsh/EHDS-models/travelHistory.fsh) — `header.status` binding.** The WP leaves the binding cell blank; the export specifies Not defined.

    **PROPOSED WP CHANGE — comments 65–67:** the original note allows both options, while the new reply requests “Not defined” and is followed by agreement. The export matches the clarified proposal.

28. **[EHDSCarePlan](../input/fsh/EHDS-models/carePlan.fsh) — missing level for `status`.** In the WP, the status row has a blank Level cell, while the surrounding metadata have level `++`. The export lists it as `header.status` at level `++`. The full description matches.

    **PROPOSED WP CHANGE — comment 42:** “++ is missing”. The export already places the element at level `++` and matches this proposal. For the content comparison, the WP row was assigned to the header based on the surrounding metadata.

29. **[Data type table](../input/pagecontent/datatypes.md) — integer64.** The WP has two rows named integer. The second describes a 64-bit integer; the model documentation labels it integer64.

    **PROPOSED WP CHANGE — comments 70–71:** identify the row as a duplicate, state that integer64 is no longer used and propose deleting the row. This proposal therefore goes beyond renaming the row. This item concerns type documentation, rather than the Word export of the 42 models.

30. **[Data type table](../input/pagecontent/datatypes.md) — reference to common data groups: RESOLVED.** The model documentation now refers to “the EHDS common data groups as defined in Annex X”, matching the WP. The definitions of string, uri and Narrative also match.

31. **[EHDSMedicalTestReport](../input/fsh/EHDS-models/medicalTestReport.fsh) — number of attachments in the description: RESOLVED.** Both sources now describe the `attachment` field as “Report attachment.” Its name and cardinality `0..*` also match.

32. **[Data type table](../input/pagecontent/datatypes.md) — formatting attribute appears as a table row: NEW.** The Markdown source now contains `| {:.table-bordered .table-striped .thead-light} | ... |` as a row inside the data type table. This is a formatting attribute, rather than a data type, and the WP has no corresponding row. It should be placed outside the table if intended as a table attribute. This issue concerns the supplementary Markdown documentation and does not affect the regenerated Word model tables.

    **No corresponding WP comment was found.** This is a documentation formatting issue introduced in the current source.

## Comments on matching items and other editorial proposals

The following comments are not additional existing substantive differences between the tables, but contain proposals or explanations that remain relevant:

- **EHDSAlert.otherSupportingInformation, comments 39–40:** consider uri or change the description. The WP and export both currently use string. The note represents a further proposed change, rather than a difference that has already been resolved.
- **EHDSAllergyIntolerance.agentOrAllergen, comment 41:** distinguish medication and non-medication cases in the terminology binding description. The WP and export currently use the same wording.
- **EHDSMedication.identifyingCode, comment 52:** add Identifier or update the description. Both the WP and export now use CodeableConcept, and the description does not contain the sentence about an Identifier variant. The earlier description difference no longer exists.
- **EHDSMedicationPrescription.prescriptionItem.quantityPrescribed, comment 13:** standardise UCUM terminology throughout the document. The binding of this field matches between the compared tables.
- **EHDSDosage.bounds[x], comments 47–48:** notes on UCUM wording and the inner Quantity are recorded alongside the separate proposal to remove the Range reference in item 18.
- **EHDSDischargeReport, comments 32–37:** remove hyperlinks on pastProblems[x], devicesAndImplants and procedures. These are editorial changes to WP links, rather than differences in element names, types or cardinalities.

## Complete list of comments in the current WP

The following comments are transcribed verbatim from the current local DOCX, including original spelling. IDs refer to this WP version. Selected text also includes reply anchors where present. Comments are proposals or explanations and do not themselves change the WP tables.

### Comment 2

Selected text: – Document metadata

> Possible inconsistence between Annex II and priority categiries which include also:
> - header.date | Date of finalising/issuing the document.| dateTime |1..1
> - header.countryOfOrigin | Country of origin of the document. | CodeableConcept | 0..1

### Comment 3

Selected text: The person taking

> Shall state person or organisation taking ...

### Comment 5

Selected text: authorised

> authorised or authenticated?

### Comment 6

Selected text: status

> Data type CodeableConcept is missing.

### Comment 7

Selected text: 1..1

> Inconsistent cardinality. 0..1 in derived models!

### Comment 9

Selected text: authenticated

> authenticated ot authorised?

### Comment 11

Selected text: author

> This element is derived from EHDSDataSet so it has to be author[x]

### Comment 13

Selected text: UCUM

> Unified Code for Units of Measure. https://ucum.org/ Wording differs in the document.

### Comment 14

Selected text: datetime

> More often dateTime as element name

### Comment 15

Selected text: datetime

> agree

### Comment 17

Selected text: authorised

> authorised or authenticated?

### Comment 19

Selected text: presentedForm

> Data type shall be EHDSAttachment.

### Comment 21

Selected text: results[x]

> For consistency with other repeated elements the name shaould be in singular, i.e. result[x]

### Comment 22

Selected text: results[x]

> agree

### Comment 25

Selected text: presentedForm

> Data type shall be EHDSAttachment.

### Comment 26

Selected text: keyImage

> KeyImage is missing necessary identifying elements:
> - seriesUID 1..* Identifier "Series instance UID for the series that contains the instances flagged as significant."
> - instanceUID 1..* Identifier "SOP Instance UID for the instances flagged as significant by the Key Image Note object (DICOM KOS) that flags this image."
> 
> The whole section doesn't make sense without it.

### Comment 27

Selected text: authorised

> authorised or authenticated?

### Comment 28

Selected text: DischargeReport

> For consistency, it shall be EHDSDischargeReport

### Comment 29

Selected text: datetime

> More often dateTime as element name

### Comment 30

Selected text: datetime

> agree

### Comment 31

Selected text: authenticated

> authorised or authenticated?

### Comment 32

Selected text: pastProblems[x

> Hyperlink to be removed

### Comment 33

Selected text: pastProblems[x

> agree

### Comment 34

Selected text: devicesAndImplants

> Hyperlink to be removed

### Comment 35

Selected text: devicesAndImplants

> agree

### Comment 36

Selected text: procedures

> Hyperlink to be removed

### Comment 37

Selected text: procedures

> agree

### Comment 39

Selected text: string

> Consider uri datatype, or change description

### Comment 40

Selected text: string

> agree

### Comment 41

Selected text: EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)

> Consider separating into medication and non-medication. The way it reads, SMS is allowed (but not preferred) for other, non-medication cases and SNOMED CT for all medication.

### Comment 42

Selected text: status

> ++ is missing

### Comment 43

Selected text: datetime

> More often dateTime as element name

### Comment 44

Selected text: datetime

> agree

### Comment 45

Selected text: authenticated

> authorised

### Comment 46

Selected text: , Range

> Shall be removed. Typo?

### Comment 47

Selected text: Quantity

> UCUM (units of measurement)

### Comment 48

Selected text: Quantity

> Is bound to the inner element Qauntity

### Comment 49

Selected text: ++++

> Shall be one level down!

### Comment 50

Selected text: Measurement uncertainty information about the observation result.

> Shall be the same as for EHDSObservation: Measurement uncertainty information type and interval if needed about the observation result.

### Comment 51

Selected text: Measurement uncertainty information about the observation result.

> Shall be the same as for EHDSObservation, i.e.: Measurement uncertainty information type and interval if needed about the observation result.

### Comment 52

Selected text: identifier

> Either a datatype is missing (Identifier) or the description should be updated

### Comment 54

Selected text: UCUM for units of measureEDQM Standard Terms for units of presentation

> This is not possible in FHIR model as Quantity cannot have binding (error in QA). For that LM included 2 aadditional sub-elements, both with binding to UCUM: numerator and denominator.

### Comment 55

Selected text: UCUM for units of measure

> No space for units in integer datatype

### Comment 56

Selected text: UCUM for units of measure

> Agree, should be removed.

### Comment 57

Selected text: EHDSMedication

> Guessing this should be EHDSMedicationDispense

### Comment 58

Selected text: EHDSMedication

> agree, MedicationDispense is in the model

### Comment 59

Selected text: directSubject

> EHDSObservation is parent of the EHDSLaboratoryObservation which allows  directSubject to be of type EHDSProcedure. So EHDSProcedure shall be added here as well.

### Comment 61

Selected text: type

> Shall be CodeableConcept.

### Comment 62

Selected text: measurement certainty

> should be measurement uncertainty to match with element name.

### Comment 63

Selected text: reason[x]

> Choice datatypes are separated per row

### Comment 64

Selected text: reason[x]

> Agree, should be reason[x] with mutliple data types.

### Comment 65

Selected text: CodeableConcept

> No binding or Not defined

### Comment 66

Selected text: CodeableConcept

> Should be "Not defined"

### Comment 67

Selected text: CodeableConcept

> Agree

### Comment 70

Selected text: integer

> Duplicated, integer64 is not used anymore

### Comment 71

Selected text: integer

> Agree, line to be removed.

## Identification of the compared versions

The SHA-256 hashes allow detection of changes to the source files since this comparison.

- `doc/Non-paper v3 on EHDS Article 15_issues.docx`: `73b634bcc7919df9e525da22e07ccd490ea36ed3e1bc21ac7b229d108745d5d0`
- `out/logical-models.docx`: `ae74a914ee5bce6f5aea36a8d36c0fc9ed9baae769bdd4edeb19df608d11c8d0`
- `input/pagecontent/datatypes.md`: `e26cec856d3fde85a7d8b6410862c554488fa7df699e9bc01f0fce1cb288e444`
