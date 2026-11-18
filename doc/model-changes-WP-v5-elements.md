# Model changes for WP v5

Date: 18 November 2026.

The changes below describe the logical models, including the subsequent Patient Summary source rename and resourceCategory meta-element correction, and their alignment with [WP v5](<Non paper-v5-Annex.docx>). The compiled baseline is verified against the [refreshed model tables](../out/logical-models-wp-v5-comparison.docx) and [model comparison](model-WP-v5-comparison.md). Finding numbers refer to that comparison; retained intentional exceptions include their reasons there. The later Patient Summary rename and resourceCategory meta-element correction are verified in source and are not yet reflected in the compiled models or Word tables.

## Shared metadata and document categories

| Model | Path | Current definition or change | Findings |
|---|---|---|---|
| EHDSDataSet | `header.language` | CodeableConcept, `0..*`, inherited by derived models. | 1 |
| EHDSAttachment | `language` | CodeableConcept, `0..*`. | 1 |
| EHDSDocument and derived document models | `header.documentCategory` | CodeableConcept, `1..1`, required LOINC binding and category-specific descriptions. Document-type examples distinguish the broad category from the specific type. | 2 |
| EHDSCondition and EHDSAdvanceDirective | `category` | WP resourceCategory is represented by these existing resource-level category fields with their own bindings; no separate inherited header.resourceCategory is defined. | 3 |
| EHDSDataSet | `header.clinicalEventTime[x]` | dateTime or Period, `0..1`. | 3 |
| EHDSDataSet | `header.version` | string, `0..1`; EHDSDocument retains its stricter `1..1` requirement. | 3 |
| EHDSDataSet | `header.attestation` | Base, `0..*`, with mandatory `attester[x]` and `dateTime` children. The attester allows EHDSHealthProfessional or EHDSDevice. | 3 |
| EHDSDataSet | `header.lastUpdate` | dateTime, `0..1`, representing a technical system update rather than a clinical event. | 3 |
| EHDSDataSet | `header.identifier`, `header.author[x]` | Both `1..*`, matching WP common metadata. EHDSMedicationAdministration follows the inherited identifier requirement. | 4 |

Shared metadata remains inherited where individual WP tables do not repeat it. The model retains `date` and `countryOfOrigin`, which WP includes in individual document or data-group tables despite omitting them from common metadata. The resulting WP table inconsistencies remain recorded under findings **4**, **5**, **6** and **45**. Finding **4** is open: WP must clarify whether the mandatory parent identifier/author cardinalities or optional child-table cardinalities are correct. Inheritance explains the model’s current limits without settling the intended WP requirement.

## Resource category mapping

WP `resourceCategory` is a meta-element associated with resource-level `category` fields and their resource-specific bindings. The current model defines category only where individual WP tables list it. **Whether every applicable resource should instead define or inherit category remains an open WP interpretation under finding 46.** The current mapping does not establish that other models should lack category.

The former `EHDSDataSet.header.resourceCategory` declaration and its generic binding were commented out. This removes the additional inherited field from the DataSet hierarchy while preserving the original declaration for traceability. Existing `EHDSCondition.category` and `EHDSAdvanceDirective.category` remain `0..* CodeableConcept` with required SNOMED GPS bindings, matching their WP tables. Other fields such as `documentCategory` and `eventCategory` are unchanged.

Under the current working interpretation, the comparison treats the common WP row as a semantic mapping rather than a separate concrete header field. Its previous 25 model-only occurrences have been removed from the appendix, but this does not resolve the open question of universal category coverage or inheritance. The generic meta-row is also excluded from element-description counts. This correction was checked directly in source; SUSHI and the build were not run, and the Word snapshot still contains the earlier header field.

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
| [EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) | `dosageDetails.doseAndRate` | `0..1`, matching its WP table. | 26 |
| [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) | `dosageDetails.doseAndRate` | `0..1` under the current parent limit; WP derived-table `0..*` remains an open conflict. | 26 |

EHDSAdministeredDosage derives from EHDSDosage and cannot widen the inherited maximum of 1. The current `0..1` limit in both models preserves valid inheritance while following the WP parent table. **Finding 26 remains open:** WP must clarify whether the parent maximum of 1 or the derived-table repetition is correct. The current limit is provisional, not an approved intentional exception. The dose example follows the literal WP wording “23 tablets”.

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

All these bindings have strength `required`. LaboratoryObservation uses two binding-description overrides to preserve the different spelling in its WP table. RelatedPerson matches its WP binding; Patient deliberately uses the same extension-aware wording, making the extensions in its WP description explicit. The Patient label difference is an intentional exception under finding **36**.

## Retained technical rules and identifiers

| Model | Path | Retained definition | Finding |
|---|---|---|---|
| EHDSMedication | `item.containedQuantity.numerator` | Explicit component rule with required UCUM / EDQM binding. | 29 |
| EHDSMedication | `item.containedQuantity.denominator` | Explicit component rule with required UCUM / EDQM binding. | 29 |
| EHDSImagingStudy | `series.instanceInTheSeries.keyImage.seriesUID` | Identifier, `1..*`. | 21 |
| EHDSImagingStudy | `series.instanceInTheSeries.keyImage.instanceUID` | Identifier, `1..*`. | 21 |

These four definitions are active in the compiled models. Their temporary commenting out was reversed. The explicit Ratio component rules express the binding “UCUM for units of measure / EDQM Standard Terms for units of presentation” without placing an unsupported direct binding on Ratio. The model also omits the WP UCUM binding on integer `device.deviceQuantity`, which has no unit/code component to bind.

The key-image identifiers locate the referenced series and SOP instances. A flag and textual reason alone do not supply these references. Findings **21** and **29** record these technical reasons for retaining fields or binding placements absent from WP.

EHDSObservation also retains EHDSProcedure as a `header.directSubject[x]` alternative so that its derived LaboratoryObservation model can use the alternative required by WP. Finding **33** records this intentional inheritance exception.

## Descriptions and data-type documentation

Element descriptions follow the respective WP tables, including stronger shall requirements, document representation instructions, endpoint retrieval details, PDF fallback wording and the expanded MIME description. Across 850 concrete corresponding WP fields, excluding the resourceCategory meta-row, the only remaining normalised description difference is the deliberate `as-text` spelling in finding **9**. The “at least one of body or presentedForm” requirement is stated in descriptions; this comparison does not assess executable invariants.

The [data-type table](../input/pagecontent/datatypes.md) contains all 17 WP types. It includes `time`, removes unused `integer64`, and adopts the WP definitions of Period, Range, Ratio, uri, Narrative and dateTime. The reference to common data groups intentionally points to Annex X, correcting the WP typo Annex IX. Findings **42** and **43** are resolved; **44** records the reference correction as intentional.

The model retains the lowercase `boolean` spelling used in the WP data-type table, and the existing element/model names classified as intentional naming exceptions. Their detailed reasons remain in the comparison.

## Verification

- All 42 built logical-model differentials and base definitions match the current SUSHI output. The compiled files predate the subsequent Patient Summary rename and resourceCategory correction; those two updates are verified in source.
- Regenerated 42 Word tables from the successful build and checked all 1,015 exported element rows against the compiled models.
- Independently recalculated and verified the compiled comparison at 228 literal field differences. The subsequent Patient Summary rename resolves six path rows, and the resourceCategory semantic correction removes 25 model-only rows. The current appendix contains 197 differences under the working category mapping, including repeated inherited metadata and intentional exceptions rather than 197 independent defects. Finding 46 separately tracks the open scope and inheritance of category; potential additional category fields are not counted before clarification.
- Verified the 850 concrete corresponding WP descriptions, the concrete changes listed above and all 17 data-type definitions, retaining the documented `as-text` and Annex X exceptions.
- The existing build QA reports 0 errors, 0 reported warnings and 0 broken links, with 2 warnings and 73 hints suppressed by its configuration. SUSHI and the build were not rerun for this verification.

The [comparison](model-WP-v5-comparison.md) contains the grouped findings, remaining differences, reasons for intentional exceptions and fingerprints of the reviewed artifacts.
