# Model changes for WP v5

Date: 18 November 2026. Updated: 19 November 2026.

The original [review with Aurora comments](model-WP-v5-comparison.md) is preserved separately. Implementation updates are recorded in the [working comparison](model-WP-v5-comparison-implementation.md) and this change log.

The changes below describe the logical models, including the subsequent Patient Summary source rename and resourceCategory meta-element correction, and their alignment with [WP v5](<Non paper-v5-Annex.docx>). The compiled baseline is verified against the [refreshed model tables](../out/logical-models-wp-v5-comparison.docx) and [model comparison](model-WP-v5-comparison-implementation.md). Finding numbers refer to that comparison; retained intentional exceptions include their reasons there. The later Patient Summary rename, resourceCategory correction and both Aurora implementation passes on 19 November are source-only changes and are not yet reflected in the compiled models or Word tables.

## Final review state governs implementation — 19 November

The user directs that the final review instructions govern, regardless of author. The earlier provenance audit remains evidence of how the review evolved; authorship alone is no longer a reason to undo a final instruction.

- Restored the final finding 6 date descriptions in DataSet and Document, while preserving the user's explicit cardinality decisions: DataSet `0..1`, Document and search date `1..1`.
- **Resolved by the user — findings 3 and 6:** Commented out lastUpdate in EHDSDataSet, retained it in both search models, and commented out 20 obsolete child exclusions. No active content rule refers to the removed parent element. This scoped resolution takes precedence over the conflicting review wording.
- Retained the final keyImage removal, direct Ratio binding, content exclusions, category scope and other completed changes. The parent-retention instruction and content exclusions are compatible when applied to their different scopes.
- The source/search date requirement remains open because an optional source date does not supply a mandatory search date; no fallback rule is assumed.

The working comparison records the concrete contradiction and proposed resolution. Earlier author-specific implementation notes below are historical and superseded where they conflict with this policy. Original review unchanged; no SUSHI/build or artifact regeneration.

## Review authorship verified against Git — 19 November

Compared the midnight baseline `09d91c67` (18 November, 23:42 +01:00) with AuroraJoala's `71bbed70` and `96fb0898`, then Konstantin's `956292b0`. The baseline contains neither Aurora nor Outcome blocks. The [working comparison](model-WP-v5-comparison-implementation.md) records the per-finding provenance and substantive differences. Earlier claims that the Outcome label established authorship, or that all Outcome wording was Aurora's, are withdrawn.

- **3 and 45 — Aurora:** Retained clinicalEventTime[x], version and attestation in EHDSDataSet. Their `0..0` exclusions in the 19 direct data-group branches remain active; LaboratoryObservation inherits them. lastUpdate is separately commented out by the later user resolution. Document excludes clinicalEventTime[x] but retains version and attestation. This satisfies the parent-retention instruction while preventing search fields from being inherited into individual content models.
- **6 — final user resolution:** lastUpdate is commented out in DataSet and retained in both separate search models. Its 20 obsolete content exclusions are commented out. The Git provenance of the differing instructions remains documented in the working comparison.
- **5 and 6 — final state:** Retained DataSet date `0..1`, Document date `1..1`, and Document countryOfOrigin `0..1`; date descriptions use the final finalisation/issuance wording. These are explicitly stated in Aurora's commit `96fb0898`. The finalisation/issuance rewording and mandatory general metadata date were introduced in Konstantin's later revision.
- **21 — Aurora's revised instruction:** Kept the extra keyImage.seriesUID and instanceUID rules commented out. Aurora changed her earlier keep instruction to remove them in `96fb0898`; the later Outcome label did not originate that decision. Mandatory containing series and instance identifiers are unchanged.
- **29 — explicit user decision:** Kept the direct Ratio binding and commented component rules. Git shows that Aurora requested component bindings, while Konstantin introduced the higher-level wording in `956292b0`. The user explicitly selected the direct binding, so it remains despite its unsupported target. It must not be reported as a passing validation result.
- **46 — Aurora:** Concrete category remains limited to Condition and AdvanceDirective. Her comments also proposed removing resourceCategory from data-group search metadata; no extra inherited or search field is added.

## Independent search metadata models — user request

Added [EHDSSearchMetadata](../input/fsh/EHDS-models/searchMetadata.fsh) and [EHDSDocumentSearchMetadata](../input/fsh/EHDS-models/documentSearchMetadata.fsh), registered in the metadata artifact group. The latter derives only from the former. Content models remain in the separate DataSet/Document hierarchy; parent metadata other than lastUpdate is retained with explicit content exclusions as described above. Document search metadata does not include countryOfOrigin or presentedForm.

The two-model structure is an implementation choice based on the two distinct Annex III common-metadata tables. The document variant adds document-specific search fields and stricter cardinalities while reusing the common definitions. The user requested search metadata but did not explicitly request two models.

Search date remains `1..1` by the user's explicit decision. **Its mismatch with optional source dates remains open:** no fallback or rule for obtaining a missing source date has been specified. It follows the final review and the explicit user decision. Generic search identifier/author are optional in the current implementation, aligned with resource cardinalities; Aurora's finding 4 explicitly addresses DataSet and individual data groups, rather than a separately specified search-model cardinality. The document variant requires both. Both search models retain lastUpdate.

## Other Aurora instructions retained

- **4:** DataSet identifier and author are `0..*`; explicit document requirements are unchanged. The user's existing optional-author change is preserved.
- **25:** gestationalAge is `0..1 string`; the inapplicable UCUM binding is commented out.
- **26:** doseAndRate is `0..*` in Dosage and AdministeredDosage.
- **38:** TravelHistory status uses HL7 Observation Status.
- **37:** Procedure.reason[x] uses `SNOMED GPS (preferred), ICD-10, ORPHAcode`, with required strength.
- Existing naming, as-text, boolean, identifier-type wording and Annex X references conform to the remaining Aurora comments. Annex-only instructions are not additional model edits.

The original review is unchanged. Source checks cover all 44 current models; compiled artifacts, Word tables and historical comparison counts have not been refreshed. SUSHI and the build were not run.

## Shared metadata and document categories

| Model | Path | Current definition or change | Findings |
|---|---|---|---|
| EHDSDataSet | `header.language` | CodeableConcept, `0..*`, inherited by derived models. | 1 |
| EHDSAttachment | `language` | CodeableConcept, `0..*`. | 1 |
| EHDSDocument and derived document models | `header.documentCategory` | CodeableConcept, `1..1`, required LOINC binding and category-specific descriptions. Document-type examples distinguish the broad category from the specific type. | 2 |
| EHDSCondition and EHDSAdvanceDirective | `category` | WP resourceCategory is represented by these existing resource-level category fields with their own bindings; no separate inherited header.resourceCategory is defined. | 3 |
| EHDSDataSet; EHDSSearchMetadata | `header.clinicalEventTime[x]`; `clinicalEventTime[x]` | dateTime or Period, `0..1`; retained in the parent/search definitions and excluded from content descendants. | 3, 45 |
| EHDSDataSet; EHDSSearchMetadata; EHDSDocument | `header.version`; `version` | Parent/search version is `0..1 string`; Document constrains its inherited version to `1..1`. | 3, 45 |
| EHDSDataSet; EHDSSearchMetadata; EHDSDocument | `header.attestation`; `attestation` | Parent/search definition is `0..* Base` with mandatory attester[x] and dateTime; Document retains its inherited attestation with document descriptions. | 3, 45 |
| EHDSDataSet and EHDSDocument | `header.date` | Original content-date descriptions retained: DataSet `0..1`, Document `1..1`, as explicitly specified by Aurora. | 5 |
| EHDSDataSet; search models; content descendants | `header.lastUpdate`; `lastUpdate` | Commented out in DataSet; active as `0..1 dateTime` in both search models. Obsolete child exclusions are commented out. | 6, 45 |
| EHDSDataSet | `header.identifier`, `header.author[x]` | Both `0..*`, following Aurora’s instruction to use individual data-group cardinalities. The user had already made author optional; identifier was aligned in this pass. | 4 |

Shared definitions remain in DataSet under Aurora 3; search-only inherited fields are suppressed in individual content branches under Aurora 45. Separate search models contain the search metadata. The model retains `date` and `countryOfOrigin`, which WP includes in individual document or data-group tables despite omitting them from common metadata. The resulting WP table inconsistencies remain recorded under findings **4**, **5**, **6** and **45**. Aurora resolved finding **4** in favour of optional `0..*` cardinalities; DataSet now permits that inheritance. The review snapshot retains the earlier WP wording until the next comparison refresh.

## Resource category mapping

WP `resourceCategory` is a meta-element associated with resource-level `category` fields and their resource-specific bindings. The current model defines category only where individual WP tables list it. **Aurora confirmed under finding 46 that category is limited to the models explicitly listing it.** Other models must not acquire category through inheritance.

The former `EHDSDataSet.header.resourceCategory` declaration and its generic binding were commented out. This removes the additional inherited field from the DataSet hierarchy while preserving the original declaration for traceability. Existing `EHDSCondition.category` and `EHDSAdvanceDirective.category` remain `0..* CodeableConcept` with required SNOMED GPS bindings, matching their WP tables. Other fields such as `documentCategory` and `eventCategory` are unchanged.

Under the current working interpretation, the comparison treats the common WP row as a semantic mapping rather than a separate concrete header field. Its previous 25 model-only occurrences have been removed from the appendix, and Aurora’s finding 46 response confirms that category must not be inherited universally. The generic meta-row is also excluded from element-description counts. This correction was checked directly in source; SUSHI and the build were not run, and the Word snapshot still contains the earlier header field.

## Patient Summary and allergy data

The six Patient Summary sections `allergiesAndIntolerances`, `problems`, `medicationSummary`, `medicalDevicesAndImplants`, `procedures` and `immunisations` are now optional (`0..1`), resolving finding **8**.

All six `emptyReason` descriptions instruct the use of `as-text` when information is available only as unstructured text. The model deliberately uses the same spelling throughout; WP uses `as text` in the allergy section. This is the intentional exception in finding **9**.

| Model | Added path | Data type | Cardinality | Finding |
|---|---|---|---|---|
| [EHDSAllergyIntolerance](../input/fsh/EHDS-models/allergy.fsh) | `reaction.substance` | CodeableConcept | `0..1` | 24 |

The description is “Specific substance or pharmaceutical product considered responsible for the reaction episode in which the allergy or intolerance was detected.” Its required binding is “EMA SPOR SMS (preferred for medication), SNOMED GPS (for medication groupings), SNOMED GPS (preferred for other cases)”. Both match WP.

## Patient Summary care plan names

| Previous path | Current path |
|---|---|
| `carePlan` | `carePlans` |
| `carePlan.generatedNarrative` | `carePlans.generatedNarrative` |
| `carePlan.carePlans` | `carePlans.carePlan` |

The section is `carePlans` (`0..1`) and its repeatable EHDSCarePlan child is `carePlan` (`0..*`), matching WP. Types, cardinalities and descriptions are unchanged. Finding **10** is resolved in FSH source and is no longer an intentional naming exception. This later correction was verified directly in patientSummary.fsh; SUSHI and the build were not run, so the compiled models and Word tables still show the preceding names.

## Imaging cardinalities and alert reference

| Model | Path | Previous definition | Current definition | Finding |
|---|---|---|---|---|
| [EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) | `endpoint` | `0..1 EHDSEndpoint` | `0..* EHDSEndpoint` | 17 |
| EHDSImagingStudy | `series.seriesEndpoint` | `0..1 EHDSEndpoint` | `1..* EHDSEndpoint` | 17 |
| EHDSImagingStudy | `series` | `0..* Base` | `1..* Base` | 18 |
| [EHDSAlert](../input/fsh/EHDS-models/alert.fsh) | `sourceReference` | `otherSupportingInformation`, `0..* string` | `sourceReference`, `0..* uri` | 23 |

These definitions match WP. ImagingStudy also uses the WP description requiring `numberOfInstances` when at least one instance is present.

## Medication and dosage

| Model | Path | Current definition or change | Finding |
|---|---|---|---|
| EHDSMedicationPrescription | `prescriptionItem.quantityPrescribed` | The description scopes the quantity to the individual prescription item. | 12 |
| EHDSMedicationPrescription | `prescriptionItem.offLabel.isOffLabelUse` | The description specifies true for off-label use, false otherwise, and true whenever a reason is supplied. | 12 |
| [EHDSMedication](../input/fsh/EHDS-models/medication.fsh) | `identifyingCode[x]` | CodeableConcept or Identifier, `0..*`, with the WP description and binding. | 28 |
| [EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) | `dosageDetails.doseAndRate` | `0..*`, following Aurora’s instruction; the WP parent table needs updating. | 26 |
| [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) | `dosageDetails.doseAndRate` | `0..*`, matching the derived WP table and updated parent model. | 26 |

EHDSAdministeredDosage derives from EHDSDosage. Aurora resolved finding **26** by allowing repetition in both models; both now use `0..*`, preserving valid inheritance. The dose example follows the literal WP wording “23 tablets”.

## Terminology bindings

| Model | Path | Current binding description | Finding |
|---|---|---|---|
| EHDSImagingReport | `header.status` | HL7 Composition Status | 14 |
| EHDSImagingStudy | `series.instanceInTheSeries.keyImage.flag` | DICOM PS3.16 CID 7010 | 20 |
| EHDSImmunisation | `vaccine` | WHO ATC, SNOMED GPS (preferred) | 31 |
| EHDSObservation and EHDSLaboratoryObservation | `type`, `component.type` | SNOMED GPS, LOINC (preferred), NPU | 32 |
| EHDSObservation | `result.uncertainty.type`, `component.result.uncertainty.type` | HL7 ProbabilityDistributionType | 34 |
| EHDSLaboratoryObservation | `result.uncertainty.type`, `component.result.uncertainty.type` | HL7 Probability Distribution Type | 34 |
| EHDSPatient and EHDSRelatedPerson | `identifier.type` | HL7 Identifier Type with an appropriate extension | 36 |
| EHDSProcedure | `reason[x]` | SNOMED GPS (preferred), ICD-10, ORPHAcode | 37 |

All these bindings have strength `required`. LaboratoryObservation uses two binding-description overrides to preserve the different spelling in its WP table. RelatedPerson matches its WP binding; Patient deliberately uses the same extension-aware wording, making the extensions in its WP description explicit. The Patient label difference is an intentional exception under finding **36**.

## Datatype binding and key-image identifiers after review

| Model | Path | Current source state | Finding |
|---|---|---|---|
| EHDSMedication | `item.containedQuantity` | Ratio with a direct required UCUM / EDQM binding, explicitly requested despite the unsupported binding target. | 29 |
| EHDSMedication | `item.containedQuantity.numerator`, `denominator` | Explicit component rules are commented out. | 29 |
| EHDSImagingStudy | `series.instanceInTheSeries.keyImage.seriesUID`, `instanceUID` | Duplicate definitions are commented out. | 21 |
| EHDSImagingStudy | `series.seriesUid`, `series.instanceInTheSeries.instanceUid` | Containing identifiers remain mandatory `1..1 Identifier`. | 21 |

These decisions replace the earlier restoration of the four explicit child rules. The Ratio binding follows the user's explicit instruction; Git attributes the higher-level review wording to Konstantin, and the binding remains a known unsupported target, not a technically validated alternative. No UCUM binding was added to integer deviceQuantity. For images, Aurora's revised comment in `96fb0898` relies on the containing series/instance identifiers and retrieving the DICOM KOS document for its references.

EHDSObservation retains EHDSProcedure as a header.directSubject[x] alternative so that its derived LaboratoryObservation model can use the alternative required by WP. Aurora's comment in `96fb0898` explicitly confirms this; it was later relabelled Outcome.

## Descriptions and data-type documentation

The compiled comparison baseline follows the respective WP descriptions, including stronger shall requirements, document representation instructions, endpoint retrieval details, PDF fallback wording and the expanded MIME description. Its 850 concrete corresponding WP fields, excluding the resourceCategory meta-row, had only the deliberate as-text difference. The parent content-date descriptions follow the final finalisation/issuance wording; search date wording and its mandatory cardinality remain separate user-selected requirements. The comparison has not been recomputed after the source changes. The “at least one of body or presentedForm” requirement is stated in descriptions; this comparison does not assess executable invariants.

The [data-type table](../input/pagecontent/datatypes.md) contains all 17 WP types. It includes `time`, removes unused `integer64`, and adopts the WP definitions of Period, Range, Ratio, uri, Narrative and dateTime. The reference to common data groups intentionally points to Annex X, correcting the WP typo Annex IX. Findings **42** and **43** are resolved; **44** records the reference correction as intentional.

The model retains the lowercase `boolean` spelling used in the WP data-type table, and the existing element/model names classified as intentional naming exceptions. Their detailed reasons remain in the comparison.

## Verification

- All 42 built logical-model differentials and base definitions match the current SUSHI output. The compiled files predate the subsequent Patient Summary rename, resourceCategory correction and both Aurora implementation passes; these later changes are verified in source only.
- Regenerated 42 Word tables from the successful build and checked all 1,015 exported element rows against the compiled models.
- Independently recalculated and verified the compiled comparison at 228 literal field differences. The subsequent Patient Summary rename resolves six path rows, and the resourceCategory semantic correction removes 25 model-only rows. The current appendix contains 197 differences under the working category mapping, including repeated inherited metadata and intentional exceptions rather than 197 independent defects. This is the pre-Aurora comparison snapshot. Aurora has since confirmed that category is limited to the explicitly listed models; no additional category fields are needed. The effects of the 19 November source changes have not been incorporated into these snapshot counts.
- Verified the 850 concrete corresponding WP descriptions, the concrete changes listed above and all 17 data-type definitions, retaining the documented `as-text` and Annex X exceptions.
- The existing build QA reports 0 errors, 0 reported warnings and 0 broken links, with 2 warnings and 73 hints suppressed by its configuration. SUSHI and the build were not rerun for this verification.

The [comparison](model-WP-v5-comparison-implementation.md) contains the grouped findings, remaining differences, reasons for intentional exceptions and fingerprints of the reviewed artifacts.
