Logical: EHDSAttachment
Title: "Attachment model"
Description: "EHDSAttachment means a structured set of data elements describing additional content, in a format identifiable by a MIME type, including images, clinical reports, or other documents."

* contentType 0..1 CodeableConcept "The Multipurpose Internet Mail Extensions (MIME) type identifying the format of the content in the attachment. Where applicable, it includes a parameter specifying the character encoding used for text content (e.g. “text/plain; charset=UTF-8”)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "BCP 13"
  * ^binding.strength = #required
* language 0..* CodeableConcept "Human language of the content."  // TODO: Check cardinality, FHIR does not support resources to be written in more than 1 bse language.
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
  * ^binding.description = "BCP 47"
  * ^binding.strength = #required
* data 0..1 base64Binary "The actual data of the attachment – a sequence of bytes, base64-encoded."
   //* insert Full(#SHALL)
   //* insert Basic(#SHALL)
* url 0..1 uri "A location where the data may be accessed."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* size 0..1 integer "The number of bytes of data that make up this attachment (before base64 encoding)."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
* title 0..1 string "A label or set of text to display in place of the data."
   //* insert Full(#SHOULD)
   //* insert Basic(#SHOULD)
