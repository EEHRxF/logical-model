# Data types and references - EHDS Logical Information Models v0.3.0

## Data types and references

EHDS models use FHIR data types for defining data types, but with less constraints and without additional elements or extensions that may be provided in the FHIR specification. The following data types are used in logical models.

### Definitions of used data types

| | |
| :--- | :--- |
| Base | A foundational data type that provides shared structure and characteristics for other data types. Carries no value itself. |
| base64Binary | A sequence of bytes encoded in base64 format. |
| boolean | A binary value, either true or false. |
| CodeableConcept | A coded data type used to designate data fields. |
| dateTime | A date, time or partial date (e.g. YYYY, YYYY-MM, YYYY-MM-DD, or YYYY-MM-DDThh:mm:ss+zz:zz). When hours and minutes are included, a time zone offset is required. |
| decimal | A numerical value consisting of a whole and a fractional part. Precision is determined by the use case. |
| EHDS[Name of the data group] | A reference to the EHDS common data groups determined in Annex X. |
| Identifier | A value that uniquely and unambiguously identifies an entity, coupled with its source system where applicable. |
| integer | A whole number, positive or negative, as determined by the use case. |
| Period | A time interval determined by start date and time, or both. Either the start or the end may be unspecified, allowing for open-ended periods or deadlines. Precision is determined by the use case. |
| Quantity | A numerical value, integer or decimal, accompanied by a unit of measure, preferably expressed as a coded concept. |
| Range | An interval determined by a minimum and maximum Quantity. |
| Ratio | A relationship between two Quantity values expressed as a numerator and a denominator. |
| string | A sequence of Unicode characters. |
| time | A time of day in the form hh:mm:ss, with an optional fractional second, without a date or time zone. |
| uri | A URI reference. |
| Narrative | A human-readable XHTML summary of a resource compliant with HL7 FHIR, conveying its essential clinical and business information in a form safe to render independently of the resource’s structured data. Its status indicates the relationship between the narrative content and the underlying encoded data. |

### Reference or contained data

Knowing if a block of data is technically included as a reference or physically contained is not always possible in models. In some cases, a reference is most likely, but there are always exceptions, and the line is never clear. Therefore, when a data type is another model, it does not define whether it should be referenced or contained. These choices are implementation-specific - for example, identifiers or technical references are more likely to be used within a country while containing full information objects is common for crossborder use.

### Polymorphic elements

In some cases a choice between data types is allowed. In that case, the grouper element is marked with [x] and a type-specific element (called "slice" in FHIR) is automatically created for each data type. Only one choice out of the options is allowed to be used at any given time, but when element is repeatable, the repeats may include data of different data types.

