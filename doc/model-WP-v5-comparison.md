# Comparison of the current model with Non paper version 5

Comparison date: 18 November 2026. Verified against compiled models and refreshed Word tables, with the subsequent Patient Summary rename and resourceCategory meta-element correction checked in FSH source.

Element descriptions match WP v5 except for the explicitly requested `as-text` spelling in the allergy emptyReason description. Structural and terminology differences remain. New shared metadata and mandatory identifiers/authors now match common WP metadata, while many repeated WP tables still use older definitions.

> ⚪ **Open finding 46 — category scope and inheritance require clarification.** WP defines resourceCategory in common metadata but shows concrete category elements only in Condition and AdvanceDirective. It does not explicitly establish whether all resource models should define or inherit category, or only the models whose individual tables list it. The current model uses the latter interpretation; this is a working interpretation, not a confirmed general WP rule.

> ⚪ **Open findings 4 and 26 — parent or child cardinalities?** All 35 cardinality differences require clarification of which conflicting WP definitions are correct. Inheritance explains the current model limits but does not establish that the WP parent definitions are authoritative.

## Sources and scope

- WP: [Non paper-v5-Annex.docx](<Non paper-v5-Annex.docx>).
- Compiled model table snapshot: [logical-models-wp-v5-comparison.docx](../out/logical-models-wp-v5-comparison.docx), regenerated from the successful build's `output/StructureDefinition-*.json` files.
- The differentials and base definitions of all 42 built logical models match the current SUSHI output in `fsh-generated/resources`. These compiled files precede the subsequent Patient Summary rename (finding 10) and the source correction removing the separate header.resourceCategory field. Those updates are checked in FSH source; the Word snapshot still reflects the earlier definitions.
- Supplementary documentation: [datatypes.md](../input/pagecontent/datatypes.md), with 17 type definitions and the intentional correction of the Annex reference (finding 44).
- Implemented changes and retained exceptions: [model-changes-WP-v5-elements.md](model-changes-WP-v5-elements.md). The existing [logical-models.docx](../out/logical-models.docx) and [v3 comparison](porovnani-tabulek-WP-v3.md) are preserved.

The existing build QA report, dated 18 November 2026 at 23:06:29 +01:00, records 0 errors, 0 reported warnings and 0 broken links; 2 warnings and 73 hints were suppressed by the build configuration. This refresh reused that build without rerunning SUSHI or IG Publisher. All 42 Word tables and their 1,015 element rows were checked against the compiled models. The compiled comparison was independently recalculated and verified at 228 literal field differences. The subsequent Patient Summary rename removes six path-difference rows. Treating resourceCategory as a WP meta-element and commenting out the separate inherited field removes 25 further model-only rows. The current appendix therefore contains 197 differences under that working interpretation; the unresolved scope of category is tracked separately in finding 46. The Word snapshot has not been regenerated for these source corrections. Descriptions were checked for 850 concrete corresponding WP fields, including intentional naming correspondences and excluding the generic resourceCategory meta-row: 849 match after the stated prose normalisation, with the single intentional `as-text` exception in finding 9.

WP contains 44 tables: one data-type table, one technical exchange table, two common-metadata tables and 40 named model tables. Common document metadata is compared with the EHDSDocument header; concrete common data-group metadata is mapped to the EHDSDataSet header. WP resourceCategory is treated as a meta-element mapped to resource-level category fields and their model-specific bindings. Whether category should be defined or inherited universally remains open under finding 46. The exchange table has no corresponding logical-model table. Root descriptions are excluded because the export presents model names as headings; the DischargeReport/EHDSDischargeReport root-name difference is tracked in finding 22.

Descriptions use the nearest applicable definition in the inheritance chain. Prohibited elements (`max = 0`) and their descendants are excluded. Blank levels are inferred only for CarePlan.header.status from surrounding header fields. Names and type identifiers are case-sensitive. Prose comparison normalises whitespace, punctuation, quote style and capitalisation; the meaningful `as text`/`as-text` value difference is explicitly retained. Type alternatives are compared as sets. Binding list order and punctuation separators are ignored, while explicit preferences and different binding labels are retained.

Field counts use literal paths: a rename produces one WP-only and one model-only row, and a renamed subtree can produce several such pairs. The correspondence table below exposes associated type differences that literal-path matching alone cannot count. For these correspondences all descriptions match; their labels are unchanged. Missing WP fields are not automatically instructions to remove inherited model fields.

## Resource category mapping and open inheritance question

WP resourceCategory describes a categorisation concept. The current model expresses it through the category fields explicitly listed in individual WP tables, rather than through a separate inherited header.resourceCategory field. **The scope of category and its inheritance is not settled by this mapping.** The generic common-metadata row is excluded from literal field counts under the current interpretation, while concrete category rows remain compared. This exclusion does not resolve finding 46.

| WP meta-element | Concrete model field | Cardinality | Binding |
|---|---|---|---|
| resourceCategory | [EHDSCondition.category](../input/fsh/EHDS-models/condition.fsh) | `0..*` | SNOMED GPS, required |
| resourceCategory | [EHDSAdvanceDirective.category](../input/fsh/EHDS-models/advance-directive.fsh) | `0..*` | SNOMED GPS, required |

The former EHDSDataSet.header.resourceCategory definition and binding are retained as comments for traceability. EHDSDataSet currently defines no active category field; only Condition and AdvanceDirective define category independently. Whether this coverage is sufficient requires clarification under finding 46. Existing category bindings and the distinct documentCategory/eventCategory elements are unchanged.

## Current difference totals

| Difference | Field-level occurrences |
|---|---:|
| description | 1 |
| cardinality | 35 |
| type | 5 |
| binding | 6 |
| WP only | 7 |
| Model only | 143 |
| Total | 197 |

These 197 field-level occurrences are not a count of independent defects. Of 143 model-only paths, 125 reflect the inherited clinicalEventTime[x], version, attestation subtree and lastUpdate not restated in the corresponding WP tables; see finding 45. Another four are the previously inherited lastUpdate omitted from repeated document tables. Thirty-four of 35 cardinality differences are the identifier/author requirements inherited into 17 data-group models. The remaining cardinality difference is AdministeredDosage.doseAndRate: the model currently uses the inherited `0..1` limit versus WP `0..*`. Whether the parent or derived WP limit is correct remains open under finding 26. EHDSDosage and the three ImagingStudy endpoint/series cardinalities now match WP.

The supplementary data-type differences and the root model-name difference are outside these totals. All 7 WP-only paths have corresponding model fields under different names; their name and type differences are described below. The previously missing reaction.substance is now present. The two explicit Ratio child rules are active again and are recorded as intentional model-only additions needed to express supported terminology bindings (finding 29). The two key-image identifiers are active again and are recorded as intentional model-only additions (finding 21). The original v5 findings retain their numbers so earlier references remain usable. New finding 46 explicitly tracks the unresolved scope of category; it is outside the conditional literal-field total until WP clarifies the expected model coverage.

## Open cardinality conflicts between WP parent and child tables

All **35 current cardinality differences are open WP consistency issues** under findings **4** and **26**. They follow from the parent cardinalities currently selected in the model:

| Elements | Affected models | Individual WP tables | Current model | Parent requirement | Finding |
|---|---:|---|---|---|---|
| `header.identifier` | 17 | `0..*` | `1..*` | EHDSDataSet requires a minimum of 1. | 4 |
| `header.author[x]` | 17 | `0..*` | `1..*` | EHDSDataSet requires a minimum of 1. | 4 |
| `dosageDetails.doseAndRate` | 1 | `0..*` | `0..1` | EHDSDosage permits a maximum of 1. | 26 |

A derived model can narrow an inherited cardinality, but cannot lower the parent's minimum or raise its maximum. Consequently, the 17 derived models cannot make identifier or author optional while EHDSDataSet requires them, and AdministeredDosage cannot allow multiple doseAndRate entries while EHDSDosage limits them to one.

**Inheritance enforces these limits once the parent definitions have been selected. It does not itself determine which parent cardinalities to choose.** The model uses the WP common-metadata requirements for identifier/author and the WP EHDSDosage parent-table limit for doseAndRate. Those choices conflict with individual or derived WP tables. Both findings 4 and 26 require clarification of whether the parent or child-table cardinalities are correct. Until that decision, current model values preserve valid inheritance but are provisional, not a resolution of the WP conflict. Changing only the derived cardinalities would violate the current inheritance constraints.

## Findings grouped by status

Original finding numbers are preserved. Findings are grouped by their current status and verified against the compiled models and refreshed Word tables, except for the subsequent Patient Summary rename and removal of the separate inherited resourceCategory field, which were checked in source. Each intentional exception includes its reason; the detailed table comments carry the same classification.

| Status | Findings |
|---|---:|
| ⚪ Open | 7 |
| 🟡 Partly resolved | 3 |
| 🔵 Intentional exceptions | 12 |
| ✅ Resolved within the stated scope | 24 |

The restored key-image identifiers (finding 21), restored Ratio binding rules (finding 29) and addition resolving finding 24 are listed in [the element change log](model-changes-WP-v5-elements.md). Shared metadata is retained by agreement; findings 5, 6 and 45 describe WP table inconsistencies rather than instructions to remove inherited elements.

### ⚪ Open findings

**4.** ⚪ **[EHDSDataSet](../input/fsh/EHDS-models/dataSet.fsh) — Mandatory data-group identifier and author. OPEN CARDINALITY CONFLICT.** WP common metadata requires identifier and author[x] as `1..*`, while 17 individual data-group tables use `0..*`. The current model follows the parent EHDSDataSet requirement, producing 34 cardinality differences. **Open question:** which WP cardinalities are authoritative—the common parent requirement or the individual child-table definitions? A child cannot lower the current inherited minimum from 1 to 0, but this technical constraint does not prove that the parent’s minimum is the intended one. The current `1..*` values are retained pending clarification; these differences are not classified as resolved or approved intentional exceptions.

**Aurora**: The cardinalities specified in the individual data-group tables (0..*) should be followed. The common EHDSDataSet and models should be aligned accordingly. Please note that from the WP Annex the EHDSDocument and EHDSDataSet are removed. 

**5.** ⚪ **[EHDSDocument](../input/fsh/EHDS-models/document.fsh), [EHDSDataSet](../input/fsh/EHDS-models/dataSet.fsh) — Date and country omitted from common metadata. OPEN.** Common WP document metadata still omits date and countryOfOrigin, and common data-group metadata still omits date. The model retains them. clinicalEventTime[x] represents clinical applicability and does not replace the authoring/issuing date. The shared date and country metadata are retained because WP still includes them in individual category/data-group tables.

**Aurora**: Retain in the logical models (EHDSDocument - date 1..1, CoO - 0..1) and (EHDSDataSet - date 0..1) 

**25.** ⚪ **[EHDSCurrentPregnancyStatus](../input/fsh/EHDS-models/currentPregnancyStatus.fsh) — Gestational-age data type. OPEN.** CurrentPregnancyStatus.gestationalAge remains string in WP versus Quantity in the model, both `0..1`.

**Aurora**: This is intentional, keep string. This is due to the fact that  gestational age may be expressed in weeks, days or a combination of both 

**26.** ⚪ **[EHDSDosage](../input/fsh/EHDS-models/dosage.fsh), [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) — Dose-and-rate cardinality and dose example. OPEN CARDINALITY CONFLICT.** WP EHDSDosage specifies dosageDetails.doseAndRate as `0..1`, while its derived AdministeredDosage table specifies `0..*`. The current model uses `0..1` in both, preserving valid inheritance. **Open question:** is the parent maximum of 1 correct, or should the parent permit repetition to accommodate the derived WP table? The derived model cannot widen the current parent maximum, but inheritance does not establish which WP definition is correct. The existing `0..1` setting is provisional pending clarification, not an approved intentional exception. The dose example already matches the literal WP wording “23 tablets”.

**Aurora**: Use 0..* in both EHDSDosage and EHDSAdministeredDosage.

**38.** ⚪ **[EHDSTravelHistory](../input/fsh/EHDS-models/travelHistory.fsh) — Undefined status binding. OPEN.** TravelHistory.header.status still has a blank WP binding versus Not defined in the model.

**Aurora**: Add 'HL7 Observation Status' to the status. 

**45.** ⚪ **Inherited common metadata absent from repeated WP tables — OPEN IN WP TABLES.** WP omits header.clinicalEventTime[x] in all 24 named models deriving from EHDSDataSet, and common EHDSDocument metadata also omits it. Twenty named data-group tables additionally omit inherited header.version, header.attestation with its two children, and header.lastUpdate, accounting for 100 further rows. Together these are 125 model-only occurrences. Four repeated document tables also omit header.lastUpdate (finding 6). These inherited fields are retained by agreement; the remaining common-versus-repeated WP table inconsistencies are not model-deletion tasks. resourceCategory scope and category inheritance are tracked separately as open finding 46.

**Aurora**: Do not inherit the elements, Annex III metadata is for searching. **KONSTANTIN PLEASE SIGN OFF.**

**46.** ⚪ **Resource category scope and inheritance — OPEN WP INTERPRETATION.** WP common metadata defines resourceCategory as CodeableConcept, `0..*`, with the binding supplied by the corresponding data group. Individual tables explicitly list category only for Condition and AdvanceDirective, both `0..* CodeableConcept` with SNOMED GPS binding. The current model defines those two fields independently and has no active category or resourceCategory in EHDSDataSet.

**Aurora**: Remove resourceCategory from Data group metadata. **KONSTANTIN I NEED YOU TO CONFIRM.**

**Clarification required:** does the common meta-element require every applicable resource model to define or inherit a category field with a resource-specific binding, even where its individual table omits that field, or is category limited to the models that explicitly list it? If it is universal, WP also needs to clarify the shared placement and the binding for each affected model. Cardinality `0..*` permits omission of values in an instance; it does not by itself determine whether the element must be part of every model definition.

**Aurora**: it is limited to the models that explicitly list it. 

**Current disposition:** retain the present model pending clarification. Absence of category from other individual tables is not treated as proof that it must be absent from those models. The 197 field differences reflect the current mapping; potential additional category definitions are not counted until their intended scope is established. This finding is open, not an approved intentional exception or a resolved omission.

**Aurora**: Absence of category from other individual tables IS TO BE TREATED AS PROOF THAT IT MUST BE ABSENT FROM THOSE MODELS. **KONSTANTIN I NEED YOU TO SIGN OFF.**

### 🟡 Partly resolved findings

**3.** 🟡 **[EHDSDataSet](../input/fsh/EHDS-models/dataSet.fsh) — New data-group metadata. PARTLY RESOLVED; CATEGORY SCOPE OPEN.** EHDSDataSet defines clinicalEventTime[x], version, attestation with mandatory attester[x] and dateTime, and lastUpdate with the WP types, cardinalities and descriptions. The separate header.resourceCategory declaration is commented out and category remains defined only in Condition and AdvanceDirective. Those two concrete definitions match their WP tables. **The general scope and inheritance of category remain open under finding 46**, so the common-metadata alignment is not considered fully resolved. These subsequent changes are verified in source and are not yet reflected in the compiled snapshot. Other repeated-table omissions are covered by finding 45.

**Aurora**: The existing EHDSDataSet metadata elements should be retained. As clarified under finding 46, category should only be defined in the individual data-group models where explicitly specified in the Annex.

**6.** 🟡 **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — Common metadata versus repeated document tables. PARTLY RESOLVED.** All legal-authentication descriptions now match the respective WP tables, including their common-versus-repeated wording differences. header.lastUpdate remains inherited into Patient Summary, Imaging Report, Medical Test Report and Discharge Report but is absent from their repeated WP tables. Inherited lastUpdate is retained by agreement; this remains a common-versus-repeated WP table inconsistency.

**Aurora**: The lastUpdate element is defined in Annex III as technical metadata for searching and retrieval. It is not part of the individual document content models and therefore does not need to be inherited into their headers. **KONSTANTIN PLEASE SIGN OFF.**

**37.** 🟡 **[EHDSProcedure](../input/fsh/EHDS-models/procedure.fsh) — Reason binding omitted and performer wording strengthened. PARTLY RESOLVED.** Procedure reason and performer descriptions now match WP. reason[x] still has a blank WP binding versus SNOMED GPS (preferred), ICD-10, Orphacode in the model.

**Aurora**: Please add SNOMED GPS (preferred), ICD-10, ORPHAcode as the binding requirement for EHDSProcedure.reason[x].

### 🔵 Intentional exceptions

**2.** 🔵 **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — New document category. INTENTIONAL NAMING EXCEPTION.** The required LOINC-bound `documentCategory` exists in EHDSDocument and all four derived document models with the WP descriptions. WP Patient Summary alone spells it `DocumentCategory`; other WP document tables and the model use `documentCategory`. **Reason:** lower camel case keeps the same metadata field name across all document types. The capitalisation difference changes neither its meaning nor its representation.

**Aurora**: change all to 'documentCategory'.

**9.** 🔵 **[EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) — Additional empty-reason instructions. INTENTIONAL EXCEPTION.** All six emptyReason descriptions contain the WP instructions for information available only as unstructured text. WP uses `as text` for allergies but `as-text` for the other five sections. **Reason:** the model consistently uses `as-text` in all six sections, as requested, so the same absent-data situation is described with one value throughout Patient Summary. This remains the only description difference for corresponding fields.

**Aurora**: Please change as text to 'as-text'.

**11.** 🔵 **[EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — Prescription issuing-time element renamed. INTENTIONAL NAMING EXCEPTION.** WP uses `header.dateTime` for prescription issuance; the model retains `header.date`. Types, cardinalities and descriptions match. **Reason:** `header.date` is inherited from EHDSDataSet and is used for the authoring/issuing timestamp throughout the shared metadata. Retaining that name preserves the common inherited field for prescriptions instead of introducing a differently named field with the same meaning.

**Aurora**: Please change header.dateTime to header.date in EHDSMedicationPrescription. **KONSTANTIN PLEASE SIGN OFF.**

**13.** 🔵 **[EHDSMedicationDispense](../input/fsh/EHDS-models/medicationDispense.fsh) — Case-sensitive field names and stronger wording. INTENTIONAL NAMING EXCEPTION.** Dispensation descriptions now match WP and language is repeatable. WP uses `header.Status`, `header.Language`, `Medication` and `Note`; the model uses `header.status`, `header.language`, `medication` and `note`. **Reason:** the model follows lower camel case and retains the inherited status and language names from EHDSDataSet. Initial capitals in these WP rows do not indicate different data elements.

**Aurora**: Please use lower camel case consistently in the Annex: header.status, header.language, medication and note.

**15.** 🔵 **[EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) — Result field name. INTENTIONAL NAMING EXCEPTION.** WP uses `body.examinationReport.results[x]`; the model uses `body.examinationReport.result[x]`. Corresponding types, cardinalities and descriptions match. **Reason:** the model retains the singular element name `result[x]`; repetition is expressed by cardinality. The plural WP spelling does not represent a different kind of result.

**Aurora**: Please change body.examinationReport.results[x] to body.examinationReport.result[x].

**21.** 🔵 **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — Key-image identifiers missing from WP. INTENTIONAL EXCEPTION.** The model retains active keyImage.seriesUID and keyImage.instanceUID, both Identifier, `1..*`, although WP omits them. **Reason:** keyImage needs identifiers for the referenced series and SOP instances so that the images flagged as significant can be identified unambiguously. A flag and a textual reason alone do not supply those references. Both identifiers are present in the current compiled model and Word tables.

**Aurora**: The additional keyImage.seriesUID and keyImage.instanceUID elements **can be removed**. The series and instance identifiers are already available in the containing imaging study structure. References to images flagged by a DICOM KOS document can be obtained by retrieving and inspecting that document. **KONSTANTIN, I NEED YOU TO SIGN OFF ON THIS DECISION. Please check the MS comments on file 'All templated comments to article 15 IA v3' --> Tab: Non-paper annexes  --> Rows 91 and 92**

**22.** 🔵 **[EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — Model name and stronger narrative requirements. INTENTIONAL NAMING EXCEPTION.** Discharge Report element descriptions now match WP. The WP root name remains `DischargeReport`, versus `EHDSDischargeReport` in the model. **Reason:** the EHDS prefix identifies the model consistently with the other EHDS logical models. Omitting the prefix in this WP table does not denote a separate model. Root-name differences remain outside the field-difference totals.

**Aurora**: Please change DischargeReport to EHDSDischargeReport in the Annex.

**29.** 🔵 **[EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — Quantity binding placement and unit binding on integer. INTENTIONAL EXCEPTION.** WP places UCUM/EDQM directly on item.containedQuantity (Ratio); the model retains explicit numerator and denominator rules, both with required UCUM/EDQM bindings. **Reason:** Ratio is not supported as a direct terminology-binding target in this model representation. The child rules are needed to express the unit bindings on its components; their omission from the WP table is not a reason to remove them. WP also binds UCUM to integer device.deviceQuantity; the model intentionally omits that binding because an integer carries only a count and has no unit/code component to bind. Both child rules and their bindings are present in the compiled model and Word tables.

**Aurora**: Please retain the UCUM and EDQM bindings on the numerator and denominator of containedQuantity in the logical model. Can you clarify in the Annex their application to the components of the Ratio. Lets remove the UCUM binding from device.deviceQuantity. **KONSTANTIN I NEED YOU TO CONFIRM.**

**33.** 🔵 **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh), [EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — Direct-subject alternatives. INTENTIONAL INHERITANCE EXCEPTION.** The model permits `EHDSProcedure` in `Observation.header.directSubject[x]`; WP Observation omits it, while WP LaboratoryObservation permits it. **Reason:** EHDSLaboratoryObservation derives from EHDSObservation. A derived model can restrict the inherited choice of types but cannot add a type excluded by the parent. EHDSObservation must therefore allow EHDSProcedure so that LaboratoryObservation can use the alternative required by its WP table. This difference preserves valid inheritance and the WP LaboratoryObservation content; it is not a request to remove EHDSProcedure from the model.

**Aurora**: Please retain EHDSProcedure as an allowed type for EHDSObservation.header.directSubject[x]. **KONSTANTIN I NEED YOU TO CONFIRM THIS**

**35.** 🔵 **[EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh), [EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — Capitalised Boolean types. INTENTIONAL EXCEPTION.** WP spells the type `Boolean` for LaboratoryObservation.accreditationStatus, LaboratoryObservation.pointOfCareTest and Medication.item.ingredient.isActive, while the model retains `boolean`. **Reason:** the WP data-type table itself defines the type as `boolean` with a lowercase b. The capitalised spelling in the three element rows is therefore an internal WP inconsistency. The model follows the spelling in the WP data-type table and the FHIR type name; no type change is required.

**Aurora**: Please change 'Boolean' to 'boolea'n in the three affected Annex elements.

**36.** 🔵 **[EHDSPatient](../input/fsh/EHDS-models/patient.fsh), [EHDSRelatedPerson](../input/fsh/EHDS-models/relatedPerson.fsh) — Identifier-type extension moved between columns. INTENTIONAL EXCEPTION.** Both identifier.type binding descriptions use HL7 Identifier Type with an appropriate extension. RelatedPerson now matches WP exactly; WP Patient still says only HL7 Identifier Type. **Reason:** both WP element descriptions explicitly describe identifier-type extensions. The shared binding wording makes that extension requirement explicit and consistent between Patient and RelatedPerson, while the individual codes remain listed in the element descriptions. The remaining Patient binding-label difference is intentional. Both binding descriptions are confirmed in the compiled models and Word tables.

**Aurora**: Please change the binding requirement for EHDSPatient.identifier.type to “HL7 Identifier Type with an appropriate extension”, as in EHDSRelatedPerson and the element descriptions.

**44.** 🔵 **[Data type table](../input/pagecontent/datatypes.md) — Annex reference mismatch. INTENTIONAL EXCEPTION.** The model documentation refers to Annex X for EHDS common data groups; the WP data-type definition incorrectly says Annex IX. **Reason:** the actual WP headings are “ANNEX IX – DISCHARGE REPORTS” and “ANNEX X – COMMON DATA GROUPS”. Annex X is therefore the correct destination. The documentation intentionally corrects this internal WP cross-reference error instead of copying it.

**Aurora**: Please change the reference from Annex IX to Annex X in the EHDS common data group definition in Annex I. The common data groups are defined in Annex X. 

### ✅ Resolved findings

**1.** ✅ **[EHDSDataSet](../input/fsh/EHDS-models/dataSet.fsh), [EHDSDocument](../input/fsh/EHDS-models/document.fsh), [EHDSAttachment](../input/fsh/EHDS-models/attachment.fsh) — Repeatable language. RESOLVED.** Language is repeatable (`0..*`) in EHDSDataSet and EHDSAttachment and is inherited by derived models. The differently cased `header.Language` in the WP dispensation table remains a naming issue under finding 13.
**Aurora**: OK

**7.** ✅ **[EHDSDocument](../input/fsh/EHDS-models/document.fsh) — Metadata description differences. RESOLVED.** Document metadata descriptions now match WP, including compliance, legal authenticator, authorisation time, author, language, lastUpdate and serviceSpecialty.
**Aurora**: OK

**8.** ✅ **[EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) — Six sections become optional. RESOLVED.** All six sections allergiesAndIntolerances, problems, medicationSummary, medicalDevicesAndImplants, procedures and immunisations are optional (`0..1`), matching WP.
**Aurora**: OK

**10.** ✅ **[EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) — Care-plan section renamed. RESOLVED IN FSH SOURCE.** The section is now carePlans (`0..1`) and its repeatable child is carePlan (`0..*`), matching WP. The narrative path is carePlans.generatedNarrative. Only names and resulting paths changed; types, cardinalities and descriptions are unchanged. This subsequent correction was checked directly in patientSummary.fsh; the compiled models and Word tables still contain the preceding names until the next build. SUSHI was not run.
**Aurora**: OK

**12.** ✅ **[EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — Quantity scope and off-label instructions. RESOLVED.** quantityPrescribed is explicitly scoped to the individual prescription item. isOffLabelUse specifies true for off-label use, false otherwise, and true whenever a reason is supplied. Both descriptions match WP.
**Aurora**: OK

**14.** ✅ **[EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) — Different status binding. RESOLVED.** header.status uses HL7 Composition Status, matching WP and the parent EHDSDocument model.
**Aurora**: OK

**16.** ✅ **[EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh), [EHDSMedicalTestReport](../input/fsh/EHDS-models/medicalTestReport.fsh), [EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — At least one representation is required. RESOLVED FOR DESCRIPTIONS.** Imaging Report, Medical Test Report and Discharge Report now include the WP requirement that at least one of body or presentedForm shall be present. This comparison covers the table descriptions, not executable validation invariants.
**Aurora**: OK

**17.** ✅ **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — Endpoint cardinalities. RESOLVED.** ImagingStudy.endpoint is `0..*` and series.seriesEndpoint is `1..*`, both EHDSEndpoint, matching WP. Their descriptions also match WP.
Aurora: OK

**18.** ✅ **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — Series and instance-count requirements. RESOLVED.** ImagingStudy.series is mandatory and repeatable (`1..*`), matching WP. Its description and the shall requirement in numberOfInstances also match WP.
Aurora: OK

**19.** ✅ **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — PDF fallback clarification. RESOLVED.** ImagingStudy.presentedForm now includes the WP clarification that PDF is a fallback and does not replace DICOM imaging-study exchange.
Aurora: OK

**20.** ✅ **[EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — Key-image flag binding corrected in WP. RESOLVED.** series.instanceInTheSeries.keyImage.flag uses DICOM PS3.16 CID 7010, matching WP and its comments 9–10.
Aurora: OK

**23.** ✅ **[EHDSAlert](../input/fsh/EHDS-models/alert.fsh) — Supporting reference renamed and retyped. RESOLVED.** Alert.sourceReference has type uri and cardinality `0..*`, replacing otherSupportingInformation of type string. Its name, type, cardinality and description match WP.
Aurora: OK

**24.** ✅ **[EHDSAllergyIntolerance](../input/fsh/EHDS-models/allergy.fsh) — New reaction substance and revised allergen meaning. RESOLVED.** reaction.substance is now present as CodeableConcept, `0..1`, with the WP description and required EMA SPOR SMS/SNOMED GPS binding. Descriptions of agentOrAllergen and the other existing allergy elements also match WP.
Aurora: OK

**27.** ✅ **[EHDSDosage](../input/fsh/EHDS-models/dosage.fsh), [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) — Stronger dosage narrative requirements. RESOLVED.** Dosage narrative and eventTime descriptions now use the stronger WP requirements, including shall where stated in WP.
Aurora: OK

**28.** ✅ **[EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — Identifier alternative restored. RESOLVED.** Medication.identifyingCode[x] allows CodeableConcept or Identifier with cardinality `0..*`. Its name, alternatives, description and terminology binding match WP.
Aurora: OK

**30.** ✅ **[EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — Stronger product-description requirements. RESOLVED.** Medication descriptions now match WP, including doseForm, required active ingredients, package size and implementer-defined characteristic value sets.
Aurora: OK

**31.** ✅ **[EHDSImmunisation](../input/fsh/EHDS-models/immunisation.fsh) — Preferred vaccine terminology and batch detail. RESOLVED.** Immunisation.vaccine uses WHO ATC, SNOMED GPS (preferred), matching WP. The administeredProduct batch/lot description also matches WP. Binding strength remains required.
Aurora: OK

**32.** ✅ **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh), [EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — Preferred observation terminology. RESOLVED.** The binding descriptions for type and component.type in Observation and LaboratoryObservation read SNOMED GPS, LOINC (preferred), NPU, matching WP. LOINC is preferred within the permitted terminologies; binding strength remains required.
Aurora: OK

**34.** ✅ **[EHDSObservation](../input/fsh/EHDS-models/observation.fsh), [EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — Uncertainty descriptions and binding names. RESOLVED.** Observation.result.uncertainty.type and component.result.uncertainty.type use the WP label HL7 ProbabilityDistributionType. LaboratoryObservation overrides those inherited descriptions with its own WP label HL7 Probability Distribution Type. Both tables match WP despite their different spelling. Uncertainty descriptions also match each respective table, including the WP certainty/uncertainty inconsistency; binding strength remains required.
Aurora: OK

**39.** ✅ **[EHDSEndpoint](../input/fsh/EHDS-models/endpoint.fsh) — Protocol meaning and required profiles. RESOLVED.** Endpoint connectionType and payload profile descriptions now match WP, including the required-profile wording.
Aurora: OK

**40.** ✅ **[EHDSDevice](../input/fsh/EHDS-models/device.fsh), [EHDSHumanName](../input/fsh/EHDS-models/humanName.fsh), [EHDSPatient](../input/fsh/EHDS-models/patient.fsh), [EHDSServiceRequest](../input/fsh/EHDS-models/serviceRequest.fsh), [EHDSSpecimen](../input/fsh/EHDS-models/specimen.fsh), [EHDSMedicationUse](../input/fsh/EHDS-models/medicationUse.fsh) — Other changes from recommended or expected to mandatory. RESOLVED.** The stronger requirements in Device, HumanName, Patient, ServiceRequest, Specimen and MedicationUse descriptions now match WP.
Aurora: OK

**41.** ✅ **[EHDSAttachment](../input/fsh/EHDS-models/attachment.fsh) — MIME description and comments. RESOLVED.** Attachment.contentType now contains the expanded WP MIME/character-encoding description. Comments 13–14 describe wording already incorporated in WP and the model.
Aurora: OK

**42.** ✅ **[Data type table](../input/pagecontent/datatypes.md) — time added and integer64 removed. RESOLVED IN TYPE DOCUMENTATION.** `time` is now documented with the WP definition. Unused `integer64` was removed from the data-type table; a search of the FSH sources confirmed that no model uses it. The documented type names now match all 17 types in the WP table.
Aurora: OK

**43.** ✅ **[Data type table](../input/pagecontent/datatypes.md) — Period and other type definitions. RESOLVED IN TYPE DOCUMENTATION.** Data-type descriptions match WP, including Period, Narrative, Range, Ratio, uri and dateTime, except for the intentional Annex IX-to-X correction tracked separately in finding 44. The table formatting attribute is outside the data rows.
Aurora: OK

## Corresponding fields with different names

🔵 Pure naming inconsistencies are intentional exceptions: lower camel case, singular/plural spelling, the shared date field name and the EHDS model prefix are retained. These rows remain in the literal difference totals for traceability and do not call for renaming the model elements. Type or meaning differences remain open.

| Model | WP path | Current model path | Reason for exception or remaining difference |
|---|---|---|---|
| [EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) | `header.DocumentCategory` | `header.documentCategory` | 🔵 Lower camel case keeps documentCategory consistent across document types; required LOINC category matches. |
| [EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) | `header.dateTime` | `header.date` | 🔵 Retain the inherited header.date name for the same issuance timestamp. |
| [EHDSMedicationDispense](../input/fsh/EHDS-models/medicationDispense.fsh) | `header.Status / header.Language / Medication / Note` | `header.status / header.language / medication / note` | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. |
| [EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) | `body.examinationReport.results[x]` | `body.examinationReport.result[x]` | 🔵 Retain singular result[x]; cardinality expresses repetition. |

## Complete field comparison

### [EHDSDocument](../input/fsh/EHDS-models/document.fsh) — WP table 3: Table 1 Document metadata.

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `date` | Model only | — | description: Date of finalising/issuing the document.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `countryOfOrigin` | Model only | — | description: Country of origin of the document.<br>type: CodeableConcept<br>cardinality: 0..1<br>binding: ISO 3166-1 alpha-2 | — |

### [EHDSDataSet](../input/fsh/EHDS-models/dataSet.fsh) — WP table 4: Table 2 Data group metadata

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `status` | binding | In accordance with the status ‘binding’ in the corresponding data group | Defined in the individual data set | — |
| `date` | Model only | — | description: Date and optionally time of authoring/issuing.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSPatientSummary](../input/fsh/EHDS-models/patientSummary.fsh) — WP table 5: ANNEX IV – PATIENT SUMMARIES

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.DocumentCategory` | WP only | description: Broad category of document (e.g. 60591-5 Patient summary document).<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: LOINC | — | 🔵 Lower camel case keeps documentCategory consistent across document types; required LOINC category matches. (finding 2) |
| `allergiesAndIntolerances.emptyReason` | description | Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as text’. | Reason for absence of data. The field shall be present when no allergy or intolerance entries are present. Where allergy or intolerance information is available only as unstructured text, emptyReason shall have the value ‘as-text’. | 🔵 Use as-text consistently across all six sections; WP allergy spelling as text is inconsistent (finding 9) |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.documentCategory` | Model only | — | description: Broad category of document (e.g. 60591-5 Patient summary document).<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: LOINC | 🔵 Lower camel case keeps documentCategory consistent across document types; required LOINC category matches. (finding 2) |

### [EHDSMedicationPrescription](../input/fsh/EHDS-models/medicationPrescription.fsh) — WP table 6: ANNEX V – ELECTRONIC PRESCRIPTIONS

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.dateTime` | WP only | description: Date and time of issuance (signature) of the prescription by prescriber.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — | 🔵 Retain the inherited header.date name for the same issuance timestamp. (finding 11) |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.date` | Model only | — | description: Date and time of issuance (signature) of the prescription by prescriber.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | 🔵 Retain the inherited header.date name for the same issuance timestamp. (finding 11) |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSMedicationDispense](../input/fsh/EHDS-models/medicationDispense.fsh) — WP table 7: Electronic dispensation

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.Status` | WP only | description: The status of the dispensation, e.g. completed, declined, entered-in-error.<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: HL7 Medication Dispense Status Codes | — | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `header.Language` | WP only | description: Language in which the document is written. Language is expressed by the IETF language tag.<br>type: CodeableConcept<br>cardinality: 0..*<br>binding: BCP 47 | — | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `Medication` | WP only | description: Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.<br>type: EHDSMedication<br>cardinality: 1..1<br>binding: (blank) | — | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `Note` | WP only | description: Additional information or comments.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.status` | Model only | — | description: The status of the dispensation, e.g. completed, declined, entered-in-error.<br>type: CodeableConcept<br>cardinality: 1..1<br>binding: HL7 Medication Dispense Status Codes | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `header.language` | Model only | — | description: Language in which the document is written. Language is expressed by the IETF language tag.<br>type: CodeableConcept<br>cardinality: 0..*<br>binding: BCP 47 | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `medication` | Model only | — | description: Exact dispensed product. If multiple medicinal products are dispensed together, multiple dispensation records shall be created.<br>type: EHDSMedication<br>cardinality: 1..1<br>binding: (blank) | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |
| `note` | Model only | — | description: Additional information or comments.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | 🔵 Lower camel case preserves the shared status/language names and the model naming convention; cardinalities match. (finding 13) |

### [EHDSImagingReport](../input/fsh/EHDS-models/imagingReport.fsh) — WP table 8: Table 1 Imaging report

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `body.examinationReport.results[x]` | WP only | description: Imaging report result data.<br>type: EHDSObservation, string<br>cardinality: 0..*<br>binding: (blank) | — | 🔵 Retain singular result[x]; cardinality expresses repetition. (finding 15) |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `body.examinationReport.result[x]` | Model only | — | description: Imaging report result data.<br>type: EHDSObservation, string<br>cardinality: 0..*<br>binding: (blank) | 🔵 Retain singular result[x]; cardinality expresses repetition. (finding 15) |

### [EHDSImagingStudy](../input/fsh/EHDS-models/imagingStudy.fsh) — WP table 9: Table 2 Medical imaging study

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `series.instanceInTheSeries.keyImage.seriesUID` | Model only | — | description: Series instance UID for the series that contains the instances flagged as significant.<br>type: Identifier<br>cardinality: 1..*<br>binding: (blank) | 🔵 Intentional exception (finding 21): identifies the referenced series and SOP instances; a key-image flag and reason alone cannot identify the referenced images. |
| `series.instanceInTheSeries.keyImage.instanceUID` | Model only | — | description: SOP Instance UID for the instances flagged as significant by the Key Image Note object (DICOM KOS) that flags this image.<br>type: Identifier<br>cardinality: 1..*<br>binding: (blank) | 🔵 Intentional exception (finding 21): identifies the referenced series and SOP instances; a key-image flag and reason alone cannot identify the referenced images. |

### [EHDSMedicalTestReport](../input/fsh/EHDS-models/medicalTestReport.fsh) — WP table 10: ANNEX VIII – MEDICAL TEST RESULTS, INCLUDING LABORATORY AND OTHER DIAGNOSTIC RESULTS AND RELATED REPORTS

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSDischargeReport](../input/fsh/EHDS-models/dischargeReport.fsh) — WP table 11: ANNEX IX – DISCHARGE REPORTS

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this document (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSAddress](../input/fsh/EHDS-models/address.fsh) — WP table 12: Table 1 EHDSAddress

No differences after the stated prose normalisation.

### [EHDSAdministeredDosage](../input/fsh/EHDS-models/administeredDosaging.fsh) — WP table 13: Table 2 EHDSAdministeredDosage

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `dosageDetails.doseAndRate` | cardinality | 0..* | 0..1 | ⚪ Open cardinality conflict (finding 26): WP parent specifies 0..1 but the derived table specifies 0..*. The model provisionally inherits 0..1; clarification is required whether the parent or child-table maximum is correct. |

### [EHDSAdvanceDirective](../input/fsh/EHDS-models/advance-directive.fsh) — WP table 14: Table 3 EHDSAdvanceDirective

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSAlert](../input/fsh/EHDS-models/alert.fsh) — WP table 15: Table 4 EHDSAlert

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSAllergyIntolerance](../input/fsh/EHDS-models/allergy.fsh) — WP table 16: Table 5 EHDSAllergyIntolerance

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSAttachment](../input/fsh/EHDS-models/attachment.fsh) — WP table 17: Table 6 EHDSAttachment

No differences after the stated prose normalisation.

### [EHDSBodyStructure](../input/fsh/EHDS-models/bodyStructure.fsh) — WP table 18: Table 7 EHDSBodyStructure

No differences after the stated prose normalisation.

### [EHDSCarePlan](../input/fsh/EHDS-models/carePlan.fsh) — WP table 19: Table 8 EHDSCarePlan

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSCondition](../input/fsh/EHDS-models/condition.fsh) — WP table 20: Table 9 EHDSCondition

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSCurrentPregnancyStatus](../input/fsh/EHDS-models/currentPregnancyStatus.fsh) — WP table 21: Table 10 EHDSCurrentPregnancyStatus

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `gestationalAge` | type | string | Quantity | — |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSDevice](../input/fsh/EHDS-models/device.fsh) — WP table 22: Table 11 EHDSDevice

No differences after the stated prose normalisation.

### [EHDSDeviceUse](../input/fsh/EHDS-models/deviceUse.fsh) — WP table 23: Table 12 EHDSDeviceUse

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSDosage](../input/fsh/EHDS-models/dosage.fsh) — WP table 24: Table 13 EHDSDosage

No differences after the stated prose normalisation.

### [EHDSEncounter](../input/fsh/EHDS-models/encounter.fsh) — WP table 25: Table 14 EHDSEncounter

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSEndpoint](../input/fsh/EHDS-models/endpoint.fsh) — WP table 26: Table 15 EHDSEndpoint

No differences after the stated prose normalisation.

### [EHDSHealthProfessional](../input/fsh/EHDS-models/healthProfessional.fsh) — WP table 27: Table 16 EHDSHealthProfessional.

No differences after the stated prose normalisation.

### [EHDSHumanName](../input/fsh/EHDS-models/humanName.fsh) — WP table 28: Table 17 EHDSHumanName

No differences after the stated prose normalisation.

### [EHDSImmunisation](../input/fsh/EHDS-models/immunisation.fsh) — WP table 29: Table 18 EHDSImmunisation

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSLaboratoryObservation](../input/fsh/EHDS-models/laboratoryObservation.fsh) — WP table 30: Table 19 EHDSLaboratoryObservation

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `accreditationStatus` | type | Boolean | boolean | 🔵 Intentional exception (finding 35): WP defines the type as boolean in its data-type table. Boolean in this element row is a WP capitalisation inconsistency; the model retains boolean. |
| `pointOfCareTest` | type | Boolean | boolean | 🔵 Intentional exception (finding 35): WP defines the type as boolean in its data-type table. Boolean in this element row is a WP capitalisation inconsistency; the model retains boolean. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSLocation](../input/fsh/EHDS-models/location.fsh) — WP table 31: Table 20 EHDSLocation

No differences after the stated prose normalisation.

### [EHDSMedicationAdministration](../input/fsh/EHDS-models/medicationAdministration.fsh) — WP table 32: Table 21 EHDSMedicationAdministration

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSMedication](../input/fsh/EHDS-models/medication.fsh) — WP table 33: Table 22 EHDSMedication

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `item.ingredient.isActive` | type | Boolean | boolean | 🔵 Intentional exception (finding 35): WP defines the type as boolean in its data-type table. Boolean in this element row is a WP capitalisation inconsistency; the model retains boolean. |
| `item.containedQuantity` | binding | UCUM for units of measure EDQM Standard Terms for units of presentation | (blank) | 🔵 Intentional exception (finding 29): direct binding on Ratio is unsupported; required UCUM/EDQM bindings are expressed on numerator and denominator instead. |
| `device.deviceQuantity` | binding | UCUM for units of measure | (blank) | 🔵 Intentional exception (finding 29): integer is a count without a unit/code component, so the WP UCUM binding has no supported target. |
| `item.containedQuantity.numerator` | Model only | — | description: (blank)<br>type: (blank)<br>cardinality: (blank)<br>binding: UCUM for units of measure / EDQM Standard Terms for units of presentation | 🔵 Intentional exception (finding 29): explicit component rule retained to express required unit bindings without placing an unsupported binding directly on Ratio. |
| `item.containedQuantity.denominator` | Model only | — | description: (blank)<br>type: (blank)<br>cardinality: (blank)<br>binding: UCUM for units of measure / EDQM Standard Terms for units of presentation | 🔵 Intentional exception (finding 29): explicit component rule retained to express required unit bindings without placing an unsupported binding directly on Ratio. |

### [EHDSMedicationUse](../input/fsh/EHDS-models/medicationUse.fsh) — WP table 34: Table 23 EHDSMedicationUse

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSObservation](../input/fsh/EHDS-models/observation.fsh) — WP table 35: Table 24 EHDSObservation

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.directSubject[x]` | type | EHDSDevice, EHDSLocation, EHDSPatient, string | EHDSDevice, EHDSLocation, EHDSPatient, EHDSProcedure, string | 🔵 Intentional inheritance exception (finding 33): EHDSLaboratoryObservation derives from EHDSObservation and requires EHDSProcedure under WP. A derived model cannot add a type excluded by its parent, so Observation must permit EHDSProcedure. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSOrganisation](../input/fsh/EHDS-models/organisation.fsh) — WP table 36: Table 25 EHDSOrganisation

No differences after the stated prose normalisation.

### [EHDSPatient](../input/fsh/EHDS-models/patient.fsh) — WP table 37: Table 26 EHDSPatient

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `identifier.type` | binding | HL7 Identifier Type | HL7 Identifier Type with an appropriate extension | 🔵 Intentional exception (finding 36): explicitly allows the identifier-type extensions described by WP and uses the same binding wording as RelatedPerson. |

### [EHDSPregnancyHistory](../input/fsh/EHDS-models/pregnancyHistory.fsh) — WP table 38: Table 27 EHDSPregnancyHistory

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSProcedure](../input/fsh/EHDS-models/procedure.fsh) — WP table 39: Table 28 EHDSProcedure

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `reason[x]` | binding | (blank) | SNOMED GPS (preferred), ICD-10, Orphacode | — |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSRelatedPerson](../input/fsh/EHDS-models/relatedPerson.fsh) — WP table 40: Table 29 EHDSRelatedPerson

No differences after the stated prose normalisation.

### [EHDSServiceRequest](../input/fsh/EHDS-models/serviceRequest.fsh) — WP table 41: Table 30 EHDSServiceRequest

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

### [EHDSSpecimen](../input/fsh/EHDS-models/specimen.fsh) — WP table 42: Table 31 EHDSSpecimen

No differences after the stated prose normalisation.

### [EHDSTelecom](../input/fsh/EHDS-models/telecom.fsh) — WP table 43: Table 32 EHDSTelecom

No differences after the stated prose normalisation.

### [EHDSTravelHistory](../input/fsh/EHDS-models/travelHistory.fsh) — WP table 44: Table 33 EHDSTravelHistory

| Field path | Difference | WP v5 | Current model | Comments and status |
|---|---|---|---|---|
| `header.identifier` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.author[x]` | cardinality | 0..* | 1..* | ⚪ Open cardinality conflict (finding 4): the model inherits 1..* from EHDSDataSet. WP must clarify whether that parent minimum or the child-table 0..* is correct; inheritance alone does not settle the intended requirement. |
| `header.status` | binding | (blank) | Not defined | — |
| `header.clinicalEventTime[x]` | Model only | — | description: Time or period the clinical content applies to (e.g. specimen collection time, onset of a condition, period a medication was taken).<br>type: Period, dateTime<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.version` | Model only | — | description: Version of the resource.<br>type: string<br>cardinality: 0..1<br>binding: (blank) | — |
| `header.attestation` | Model only | — | description: Resource attestation details.<br>type: Base<br>cardinality: 0..*<br>binding: (blank) | — |
| `header.attestation.attester[x]` | Model only | — | description: Attester who validated the resource.<br>type: EHDSDevice, EHDSHealthProfessional<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.attestation.dateTime` | Model only | — | description: Date and time of the approval of the resource by the attester.<br>type: dateTime<br>cardinality: 1..1<br>binding: (blank) | — |
| `header.lastUpdate` | Model only | — | description: Date and time of the last system-level update to this resource (system update instant). This is technical metadata and does not represent a clinical event time.<br>type: dateTime<br>cardinality: 0..1<br>binding: (blank) | — |

## Supplementary data type differences

All 17 type names match WP; `time` is included and unused `integer64` is absent. Definitions match except for the intentional correction of the common-data-group reference from Annex IX to Annex X.

| Type | WP v5 | Model documentation | Comments and status |
|---|---|---|---|
| EHDS[Name of the data group] | A reference to the EHDS common data groups determined in Annex IX. | A reference to the EHDS common data groups determined in Annex X. | 🔵 Intentional exception (finding 44): Annex IX contains discharge reports; Annex X contains the common data groups. |

## All comments in the v5 file

Only four comments are present. Their IDs are internal IDs in this exact file. The quoted text is transcribed directly from the DOCX, retaining original spelling; selected-text whitespace is normalised.

### Comment 9

Selected text: DICOM PS3.16 CID 7010

> @HYPPONEN Konstantin (SANTE) I think it is this: CID 7010 Key Object Selection Document Title

### Comment 10

Selected text: DICOM PS3.16 CID 7010

> Yes, it’s 7010, but PS3.16 not 3.6. I updated the text.

### Comment 13

Selected text: The Multipurpose Internet Mail Extensions (MIME) type identifying the format of the content in the attachment. Where applicable, it includes a parameter specifying the character encoding used for text content (e.g. “text/plain; charset=UTF-8”).

> @HYPPONEN Konstantin (SANTE)  - Please check.

### Comment 14

Selected text: The Multipurpose Internet Mail Extensions (MIME) type identifying the format of the content in the attachment. Where applicable, it includes a parameter specifying the character encoding used for text content (e.g. “text/plain; charset=UTF-8”).

> Apparently the new name is “media type” but the definitions are not formal enough and FHIR still refers to “mime”, so let’s keep this. Small adjustments introduced.

## Source fingerprints

- `doc/Non paper-v5-Annex.docx`: `6bc5ed4af6c99e3132b4c13f9a90b4bcb8cc8662fe90b4560b0141b6c9574958`
- `out/logical-models-wp-v5-comparison.docx`: `9a186320f2a788f6c91f20dc9e3574782b7e84c6e297a0e8a569c0c33adbf097`
- `input/pagecontent/datatypes.md`: `8a6e4cc0b1d475c6641d6b15ae958f7ff09dd9008611eb8b96732f7f3409ff3e`
- `output/qa.json`: `ea464ce3f3ddb39ee03345d988b44b68c02e202c6f94fce35cf99f5d71dfbad9`
- Current FSH source tree SHA-256 (sorted relative path, NUL, bytes, NUL): `fa93430781217683beb606a34b5a3e38a98cbd22cc4046dd1818ed912f86f8fe`
- Built logical-model JSON SHA-256 (sorted filename, NUL, bytes, NUL): `a4a17a33b16a6aee265da9bd683c5e2bcfc91f9b2dff00fe982bc116b41b2724`
