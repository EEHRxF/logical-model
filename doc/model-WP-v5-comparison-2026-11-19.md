# Logical model comparison with WP v5 — refreshed version, 19 November 2026

This is a new comparison of the current generated logical models with the supplied WP v5 annex. It preserves the [original comparison and review comments](model-WP-v5-comparison.md) and the [implementation working copy](model-WP-v5-comparison-implementation.md). The governing scope is the final review state, regardless of author, together with subsequent explicit user decisions.

The refreshed [Word tables](../out/logical-models-wp-v5-review-2026-11-19.docx) contain **44 models and 887 element rows**. This comparison maps **42 WP tables** (40 named content models and two search-metadata tables) to **852 model rows** and **851 WP rows**. DataSet and Document are implementation parents and are exported, but are not separately mapped to the search-metadata tables.

## Scope and verification

- Inputs are the current `fsh-generated/resources/StructureDefinition-*.json` files, not the older Publisher `output` directory. A frozen copy was used while the user’s separate build was running. Content hashes remained unchanged during comparison.
- Existing generated inputs were reused; this refresh did not run SUSHI or IG Publisher. It does not claim a new successful build or validation result.
- All 44 generated logical models were newer than their FSH sources when checked. All 687 explicit source cardinalities matched resolved JSON. Additional source-to-JSON checks covered 726 descriptions, 181 binding descriptions and 614 explicit type declarations.
- Every cell of all exported Word tables was checked against the frozen resolved models, including inherited fields and exclusions. Elements with maximum 0 and their descendants are omitted.
- Compared columns are element path, description, type, cardinality and binding description. WP does not provide a separate binding-strength column; executable invariants and formal terminology conformance are outside this table comparison.
- Prose comparison ignores whitespace, punctuation, quotation style and capitalisation, but preserves the meaningful as text/as-text distinction. Types and names are case-sensitive; type alternatives are compared as sets. Binding-list order, punctuation and case are ignored, while wording and preferences remain significant.
- Root descriptions and the named-model inheritance text in WP are outside field counts. The CarePlan status row with a missing level is assigned to its header. WP resourceCategory is counted as a literal WP-only search-metadata row, then classified by the final removal instruction.

## Results grouped by status

| Status | Literal field-level occurrences | Meaning |
|---|---:|---|
| Open | 2 | Search metadata identifier and author cardinalities need confirmation. |
| Applied; WP update pending | 23 | Model follows final review or user decisions; supplied WP still differs. |
| Intentional | 21 | Approved naming, type, wording, inheritance or datatype-binding exceptions. |
| **Total** | **46** | Detailed values are listed below. |

Seven naming correspondences produce 14 literal WP-only/model-only rows. Their descriptions, types, cardinalities and bindings match after pairing. Removing those 14 bookkeeping rows leaves **32 non-naming difference occurrences**. These are not 32 independent defects. Root-name and supplementary datatype-documentation differences are reported separately.

| Difference kind | Occurrences |
|---|---:|
| description | 17 |
| cardinality | 3 |
| type | 4 |
| binding | 5 |
| WP only | 8 |
| Model only | 9 |

### Open points

1. **Search metadata identifier and author cardinalities (finding 4 scope).** EHDSSearchMetadata uses identifier and author[x] `0..*`; the WP common search-metadata table still says `1..*`. Final finding 4 explicitly aligns DataSet and individual content models to `0..*`, but does not clearly state whether the independent search-metadata table should also change. The model choice is recorded, not treated as a settled WP search requirement. Document search metadata requires both and matches WP.
2. **Mandatory search date with optional source date (finding 6).** The user retains DataSet content date `0..1` and search date `1..1`. A separate model avoids an inheritance conflict but cannot supply a missing date. No fallback or derivation rule has been agreed. Document source and search date are both `1..1`. This information gap is an open specification issue, not an additional literal table-difference row.
3. **Known implementation limitation: direct Ratio binding (finding 29).** The direct UCUM/EDQM binding on item.containedQuantity matches WP and the final higher-level binding instruction and is explicitly retained by the user. Ratio is an unsupported direct binding target in this representation. Table agreement does not establish technical validity; this limitation is not counted as a WP/model difference.

### Applied review changes awaiting WP amendment

- **Date wording (6):** 16 content-date descriptions use finalisation/issuance wording instead of the supplied WP’s earlier wording. This accounts for 16 description occurrences.
- **Common metadata dates (5, 6):** date `1..1 dateTime` is present after author[x] in both search models, but absent from both common WP tables: two model-only rows.
- **Category scope (46):** resourceCategory is absent from search metadata under the final removal instruction; the supplied WP table still contains the generic row. Concrete category remains only in Condition and AdvanceDirective.
- **Dose and rate (26):** Dosage and AdministeredDosage both permit `0..*`. The supplied parent WP table still says `0..1`; its child table now matches the model.
- **Binding wording (36–38):** Patient identifier.type uses the requested extension-aware label; Procedure reason and TravelHistory status have the binding descriptions supplied by the final review. The supplied WP still has the earlier or blank values.

### Intentional differences

- **Naming (2, 11, 13, 15):** seven correspondences listed below retain shared names, lower camel case or singular element naming.
- **Absent-data wording (9):** as-text is used consistently, including the allergy section where WP says as text.
- **Lowercase boolean (35):** three WP element rows say Boolean, while the model follows boolean in the WP datatype table.
- **Observation choice (33):** the parent allows EHDSProcedure so LaboratoryObservation can use it, as required by its own WP table and confirmed by the final review.
- **Datatype bindings (25, 29):** UCUM is omitted from string gestationalAge and integer deviceQuantity because these fields do not provide the required coded unit component.

### Resolved or retained decisions without further literal differences

- The lastUpdate conflict between findings 3 and 6 is resolved by the user: its DataSet definition is commented out and it remains `0..1 dateTime` in both search models. The 20 obsolete child exclusions are commented out. No active content field or constraint refers to it; the common WP search tables match this treatment.
- Search-only clinicalEventTime[x], version and attestation are excluded from individual data-group content. Parent definitions remain, and document version/attestation remain where explicitly listed. The 125 formerly inherited extra rows are no longer current differences.
- Patient Summary carePlans and its carePlan child match WP. The six optional sections, endpoint and series cardinalities, allergy reaction substance, gestationalAge string type, identifyingCode Identifier alternative and reviewed terminology changes are present.
- The extra keyImage seriesUID and instanceUID definitions are commented out, matching the final review and WP. Mandatory containing series and instance identifiers remain.
- ContainedQuantity numerator/denominator rules are commented out, matching the higher-level representation in WP. The direct-binding limitation remains open separately above.

## Naming correspondences

| Model | WP path | Model path | Other compared values |
|---|---|---|---|
| EHDSPatientSummary | `header.DocumentCategory` | `header.documentCategory` | Match |
| EHDSMedicationPrescription | `header.dateTime` | `header.date` | Match |
| EHDSMedicationDispense | `header.Status` | `header.status` | Match |
| EHDSMedicationDispense | `header.Language` | `header.language` | Match |
| EHDSMedicationDispense | `Medication` | `medication` | Match |
| EHDSMedicationDispense | `Note` | `note` | Match |
| EHDSImagingReport | `body.examinationReport.results[x]` | `body.examinationReport.result[x]` | Match |

## Complete field comparison

Table numbers below are the one-based physical Word-table positions, matching the original review. Only differing fields are expanded; models with no literal differences are explicitly marked. Status totals count each listed difference occurrence, including both sides of naming correspondences.

### [EHDSDocumentSearchMetadata](../input/fsh/EHDS-models/documentSearchMetadata.fsh) — WP table 3: Table 1 Document metadata.

WP rows: 20; model rows: 21.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `date` | Model only | — | description: Date of finalisation/issuance of the document.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | **Applied; WP update pending** — finding 5, 6: Date added under the final review; mandatory search date retained by explicit user decision. Missing-source-date issue remains open separately. |

### [EHDSSearchMetadata](../input/fsh/EHDS-models/searchMetadata.fsh) — WP table 4: Table 2 Data group metadata

WP rows: 12; model rows: 12.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `identifier` | cardinality | 1..* | 0..* | **Open** — finding 4 / search scope: WP search metadata requires 1..*; model uses 0..*. Final finding 4 explicitly resolves content cardinalities, leaving its application to the separate search table to be confirmed. |
| `resourceCategory` | WP only | description: Data group-specific category (e.g. category of condition, category of advance directive).<br>type: CodeableConcept<br>cardinality: 0..*<br>binding: In accordance with the category ‘binding’ in the corresponding data group | — | **Applied; WP update pending** — finding 46: Final review removes this row from data-group search metadata; concrete category remains only where explicitly listed. |
| `author[x]` | cardinality | 1..* | 0..* | **Open** — finding 4 / search scope: WP search metadata requires 1..*; model uses 0..*. Final finding 4 explicitly resolves content cardinalities, leaving its application to the separate search table to be confirmed. |
| `date` | Model only | — | description: Date of finalisation/issuance of the resource.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | **Applied; WP update pending** — finding 5, 6: Date added under the final review; mandatory search date retained by explicit user decision. Missing-source-date issue remains open separately. |

### [EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) — WP table 5: ANNEX IV – PATIENT SUMMARIES

WP rows: 75; model rows: 75.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date of finalising/issuing the document. | Date of finalisation/issuance of the document. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |
| `header.DocumentCategory` | WP only | description: Broad category of document (e.g. 60591-5 Patient summary document).<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: LOINC | — | **Intentional** — finding 2: Naming correspondence; all four compared values match after pairing. |
| `allergiesAndIntolerances.emptyReason` | description | Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as text’. | Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as-text’. | **Intentional** — finding 9: Consistent as-text spelling requested by the user and final review. |
| `header.documentCategory` | Model only | — | description: Broad category of document (e.g. 60591-5 Patient summary document).<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: LOINC | **Intentional** — finding 2: Naming correspondence; all four compared values match after pairing. |

### [EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — WP table 6: ANNEX V – ELECTRONIC PRESCRIPTIONS

WP rows: 29; model rows: 29.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.dateTime` | WP only | description: Date and time of issuance (signature) of the prescription by prescriber.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — | **Intentional** — finding 11: Naming correspondence; all four compared values match after pairing. |
| `header.date` | Model only | — | description: Date and time of issuance (signature) of the prescription by prescriber.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | **Intentional** — finding 11: Naming correspondence; all four compared values match after pairing. |

### [EHDSMedicationDispense](../input/fsh/EHDS-models/medicationDispense.fsh) — WP table 7: Electronic dispensation

WP rows: 15; model rows: 15.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.Status` | WP only | description: The status of the dispensation, e.g. completed, declined, entered-in-error.<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: HL7 Medication Dispense Status Codes | — | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `header.Language` | WP only | description: Language in which the document is written. Language is expressed by the IETF language tag.<br>type: CodeableConcept<br>cardinality: 0..*<br>binding: BCP 47 | — | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `Medication` | WP only | description: Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.<br>type: EHDSMedication<br>cardinality: 1..1<br>binding: (blank) | — | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `Note` | WP only | description: Additional information or comments.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `header.status` | Model only | — | description: The status of the dispensation, e.g. completed, declined, entered-in-error.<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: HL7 Medication Dispense Status Codes | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `header.language` | Model only | — | description: Language in which the document is written. Language is expressed by the IETF language tag.<br>type: CodeableConcept<br>cardinality: 0..*<br>binding: BCP 47 | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `medication` | Model only | — | description: Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.<br>type: EHDSMedication<br>cardinality: 1..1<br>binding: (blank) | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |
| `note` | Model only | — | description: Additional information or comments.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | **Intentional** — finding 13: Naming correspondence; all four compared values match after pairing. |

### [EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) — WP table 8: Table 1 Imaging report

WP rows: 62; model rows: 62.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `body.examinationReport.results[x]` | WP only | description: Imaging report result data.<br>type: EHDSObservation, string<br>cardinality: 0..*<br>binding: (blank) | — | **Intentional** — finding 15: Naming correspondence; all four compared values match after pairing. |
| `body.examinationReport.result[x]` | Model only | — | description: Imaging report result data.<br>type: EHDSObservation, string<br>cardinality: 0..*<br>binding: (blank) | **Intentional** — finding 15: Naming correspondence; all four compared values match after pairing. |

### [EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — WP table 9: Table 2 Medical imaging study

WP rows: 37; model rows: 37.

No literal field differences.

### [EHDSMedicalTestReport](../input/fsh/EHDS-models/medicalTestReport.fsh) — WP table 10: ANNEX VIII – MEDICAL TEST RESULTS, INCLUDING LABORATORY AND OTHER DIAGNOSTIC RESULTS AND RELATED REPORTS

WP rows: 41; model rows: 41.

No literal field differences.

### [EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — WP table 11: ANNEX IX – DISCHARGE REPORTS

WP rows: 66; model rows: 66.

No literal field differences.

### [EHDSAddress](../input/fsh/EHDS-models/address.fsh) — WP table 12: Table 1 EHDSAddress

WP rows: 9; model rows: 9.

No literal field differences.

### [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) — WP table 13: Table 2 EHDSAdministeredDosage

WP rows: 8; model rows: 8.

No literal field differences.

### [EHDSAdvanceDirective](../input/fsh/EHDS-models/advance-directive.fsh) — WP table 14: Table 3 EHDSAdvanceDirective

WP rows: 11; model rows: 11.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSAlert](../input/fsh/EHDS-models/alert.fsh) — WP table 15: Table 4 EHDSAlert

WP rows: 12; model rows: 12.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSAllergyIntolerance](../input/fsh/EHDS-models/allergy.fsh) — WP table 16: Table 5 EHDSAllergyIntolerance

WP rows: 18; model rows: 18.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSAttachment](../input/fsh/EHDS-models/attachment.fsh) — WP table 17: Table 6 EHDSAttachment

WP rows: 6; model rows: 6.

No literal field differences.

### [EHDSBodyStructure](../input/fsh/EHDS-models/bodyStructure.fsh) — WP table 18: Table 7 EHDSBodyStructure

WP rows: 5; model rows: 5.

No literal field differences.

### [EHDSCarePlan](../input/fsh/EHDS-models/carePlan.fsh) — WP table 19: Table 8 EHDSCarePlan

WP rows: 13; model rows: 13.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSCondition](../input/fsh/EHDS-models/condition.fsh) — WP table 20: Table 9 EHDSCondition

WP rows: 19; model rows: 19.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSCurrentPregnancyStatus](../input/fsh/EHDS-models/currentPregnancyStatus.fsh) — WP table 21: Table 10 EHDSCurrentPregnancyStatus

WP rows: 11; model rows: 11.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |
| `gestationalAge` | binding | UCUM (units of measurement) | (blank) | **Intentional** — finding 25: String retained under final review; a UCUM code/unit binding is not applicable to string. |

### [EHDSDevice](../input/fsh/EHDS-models/device.fsh) — WP table 22: Table 11 EHDSDevice

WP rows: 14; model rows: 14.

No literal field differences.

### [EHDSDeviceUse](../input/fsh/EHDS-models/deviceUse.fsh) — WP table 23: Table 12 EHDSDeviceUse

WP rows: 12; model rows: 12.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) — WP table 24: Table 13 EHDSDosage

WP rows: 19; model rows: 19.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `dosageDetails.doseAndRate` | cardinality | 0..1 | 0..* | **Applied; WP update pending** — finding 26: Final review resolves repetition to 0..* in both parent and child; AdministeredDosage now matches its WP table. |

### [EHDSEncounter](../input/fsh/EHDS-models/encounter.fsh) — WP table 25: Table 14 EHDSEncounter

WP rows: 26; model rows: 26.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSEndpoint](../input/fsh/EHDS-models/endpoint.fsh) — WP table 26: Table 15 EHDSEndpoint

WP rows: 11; model rows: 11.

No literal field differences.

### [EHDSHealthProfessional](../input/fsh/EHDS-models/healthProfessional.fsh) — WP table 27: Table 16 EHDSHealthProfessional.

WP rows: 8; model rows: 8.

No literal field differences.

### [EHDSHumanName](../input/fsh/EHDS-models/humanName.fsh) — WP table 28: Table 17 EHDSHumanName

WP rows: 6; model rows: 6.

No literal field differences.

### [EHDSImmunisation](../input/fsh/EHDS-models/immunisation.fsh) — WP table 29: Table 18 EHDSImmunisation

WP rows: 14; model rows: 14.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — WP table 30: Table 19 EHDSLaboratoryObservation

WP rows: 58; model rows: 58.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |
| `accreditationStatus` | type | Boolean | boolean | **Intentional** — finding 35: Use lowercase boolean, consistent with the WP data-type table and final review. |
| `pointOfCareTest` | type | Boolean | boolean | **Intentional** — finding 35: Use lowercase boolean, consistent with the WP data-type table and final review. |

### [EHDSLocation](../input/fsh/EHDS-models/location.fsh) — WP table 31: Table 20 EHDSLocation

WP rows: 5; model rows: 5.

No literal field differences.

### [EHDSMedicationAdministration](../input/fsh/EHDS-models/medicationAdministration.fsh) — WP table 32: Table 21 EHDSMedicationAdministration

WP rows: 12; model rows: 12.

No literal field differences.

### [EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — WP table 33: Table 22 EHDSMedication

WP rows: 29; model rows: 29.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `item.ingredient.isActive` | type | Boolean | boolean | **Intentional** — finding 35: Use lowercase boolean, consistent with the WP data-type table and final review. |
| `device.deviceQuantity` | binding | UCUM for units of measure | (blank) | **Intentional** — finding 29: A plain integer has no unit/code component for the UCUM binding. Existing deliberate omission retained. |

### [EHDSMedicationUse](../input/fsh/EHDS-models/medicationUse.fsh) — WP table 34: Table 23 EHDSMedicationUse

WP rows: 13; model rows: 13.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSObservation](../input/fsh/EHDS-models/observation.fsh) — WP table 35: Table 24 EHDSObservation

WP rows: 52; model rows: 52.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |
| `header.directSubject[x]` | type | EHDSDevice, EHDSLocation, EHDSPatient, string | EHDSDevice, EHDSLocation, EHDSPatient, EHDSProcedure, string | **Intentional** — finding 33: Parent permits EHDSProcedure so derived LaboratoryObservation can use the alternative required in its WP table; final review confirms retention. |

### [EHDSOrganisation](../input/fsh/EHDS-models/organisation.fsh) — WP table 36: Table 25 EHDSOrganisation

WP rows: 6; model rows: 6.

No literal field differences.

### [EHDSPatient](../input/fsh/EHDS-models/patient.fsh) — WP table 37: Table 26 EHDSPatient

WP rows: 12; model rows: 12.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `identifier.type` | binding | HL7 Identifier Type | HL7 Identifier Type with an appropriate extension | **Applied; WP update pending** — finding 36: Final review explicitly requests the same extension-aware binding as RelatedPerson. |

### [EHDSPregnancyHistory](../input/fsh/EHDS-models/pregnancyHistory.fsh) — WP table 38: Table 27 EHDSPregnancyHistory

WP rows: 10; model rows: 10.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSProcedure](../input/fsh/EHDS-models/procedure.fsh) — WP table 39: Table 28 EHDSProcedure

WP rows: 17; model rows: 17.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |
| `reason[x]` | binding | (blank) | SNOMED GPS (preferred), ICD-10, Orphacode | **Applied; WP update pending** — finding 37: Final review supplies the previously blank WP binding. |

### [EHDSRelatedPerson](../input/fsh/EHDS-models/relatedPerson.fsh) — WP table 40: Table 29 EHDSRelatedPerson

WP rows: 9; model rows: 9.

No literal field differences.

### [EHDSServiceRequest](../input/fsh/EHDS-models/serviceRequest.fsh) — WP table 41: Table 30 EHDSServiceRequest

WP rows: 18; model rows: 18.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.date` | description | Date and optionally time of authoring/issuing. | Date of finalisation/issuance of the resource. | **Applied; WP update pending** — finding 6: Final review wording applied. The supplied WP still uses its earlier issuing/authoring wording. |

### [EHDSSpecimen](../input/fsh/EHDS-models/specimen.fsh) — WP table 42: Table 31 EHDSSpecimen

WP rows: 19; model rows: 19.

No literal field differences.

### [EHDSTelecom](../input/fsh/EHDS-models/telecom.fsh) — WP table 43: Table 32 EHDSTelecom

WP rows: 3; model rows: 3.

No literal field differences.

### [EHDSTravelHistory](../input/fsh/EHDS-models/travelHistory.fsh) — WP table 44: Table 33 EHDSTravelHistory

WP rows: 9; model rows: 9.

| Path | Difference | WP value | Model value | Status and reason |
|---|---|---|---|---|
| `header.status` | binding | (blank) | HL7 Observation Status | **Applied; WP update pending** — finding 38: Final review supplies the previously blank WP binding. |

## Exported implementation parents

EHDSDataSet and EHDSDocument are included in the Word export as implementation parents. They have no separate named content tables in WP. Their inclusion is not counted as missing WP content and does not substitute their headers for the separate search-metadata tables.

| Model | Exported element rows |
|---|---:|
| EHDSDataSet | 12 |
| EHDSDocument | 23 |

## Supplementary datatype and root-name checks

- All **17 datatype names** match WP, including time; unused integer64 is absent. All definitions match under the stated prose normalisation except the deliberate Annex reference correction below.
- **Finding 44:** datatypes.md refers to Annex X for common data groups; WP still says Annex IX. Actual Annex IX contains discharge reports and Annex X common data groups. This is an intentional correction outside field counts.
- **Finding 22:** the model retains EHDSDischargeReport; the WP root row says DischargeReport. The final review requests the EHDS prefix in the Annex. Root names are outside field counts.
- The review requests removing DataSet/Document as named Annex parents, while some individual WP root rows still describe derivation from them. That publishing/reference issue is outside element-value counts; the model’s implementation inheritance remains intact.
- The WP file still contains four embedded comments (IDs 9, 10, 13 and 14). They concern the DICOM flag terminology and MIME wording already represented in the tables; no separate unresolved element discrepancy is inferred from them.

## Reproduction and input fingerprints

Tables were generated with the existing exporter:

```sh
python3 -B scripts/generate_logical_model_docx.py --input-path fsh-generated/resources --output out/logical-models-wp-v5-review-2026-11-19.docx
```

[Machine-readable comparison and per-file fingerprints](../out/model-WP-v5-comparison-2026-11-19.json) preserve all WP/model values, differences, table mappings and input hashes. The hashes describe this refresh, not the older build artifacts.

| Input or artifact | SHA-256 |
|---|---|
| doc/Non paper-v5-Annex.docx | `6bc5ed4af6c99e3132b4c13f9a90b4bcb8cc8662fe90b4560b0141b6c9574958` |
| out/logical-models-wp-v5-review-2026-11-19.docx | `3ca2196ffd41eb444776490c55b17dd777dfc13bdf38a9506b6dd5ba5d0ce1ad` |
| doc/model-WP-v5-comparison.md | `19055f17cbcde5b0ed0b54c2b1964db0f311632e7534e6a1a7f1629b2d4d9101` |
| input/pagecontent/datatypes.md | `8a6e4cc0b1d475c6641d6b15ae958f7ff09dd9008611eb8b96732f7f3409ff3e` |
| Current FSH source tree | `290b5dc06889b2a07303f2c78ebea578e13700f73b653be3bd43c9f142636095` |
| Generated logical-model JSON tree | `df5a5dab30fa07e08652e12b869199fe9e2c5ecc69b4be62e55e40a62302cc6d` |

All previous comparison files, review comments and Word exports were preserved. No logical-model source was modified for this refresh.
