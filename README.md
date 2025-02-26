**Federal Acquisition Regulation (FAR) Integration Guide**

**Table of Contents**

- [Introduction](#Introduction)

- [FAR Updates and Tracking Changes](#far-updates-and-tracking-changes)

- [Fill-in Clauses in the FAR](#fill-in-clauses-in-the-far)

- [Incorporating FAR Content into Contract Writing Systems](#incorporating-far-content-into-contract-writing-systems)

- [Example Scenario](#example-scenario)

---

## Introduction

The \*\*Federal Acquisition Regulation (FAR)\*\* is the cornerstone regulation for federal agencies acquiring supplies and services with appropriated funds. It provides a structured framework to ensure consistency and compliance in the government’s procurement processes.

This guide is crafted for developers to demystify the FAR’s structure, illustrate how it evolves through updates, and demonstrate how to seamlessly integrate FAR content into contract writing systems, especially when managing fill-in clauses. Whether you’re building tools for government contracting officers or vendors, this readme will equip you with the knowledge to handle FAR data effectively.

---

## **FAR Updates and Tracking Changes**

The FAR is a living document updated through Federal Acquisition Circulars (FACs). Each FAC introduces revisions and is uniquely identified by a number and effective date. Since fiscal year 2019, FACs have followed a naming convention in which the first four digits represent the fiscal year and the last two indicate the sequence (e.g., FAC 2025-03, effective January 17, 2025).

### **Tracking Changes in the FAR**

Updates are embedded in the FAR text using XML attributes and processing instructions:

The `rev` Attribute**: This marks specific text revisions with the FAC number and effective date. For example:
`
<ph rev="FAC 2025-03 January 17, 2025" class="- topic/ph ">proposed for debarment, or voluntarily excluded, as</ph>`

**List of Sections Affected (LSA) Markers**: For the LSA table (LSATable.dita), changes are detailed with processing instructions surrounding affected text. These include:

* `<?FM MARKER [CaseNumber] FAR Case ####-###?>`: Links the change to a specific FAR case.  
*  `<?FM MARKER [Why] ...?>`: Explains the change (e.g., text added or removed).

Example:
`
<ph rev="FAC 2025-03 January 17, 2025" class="- topic/ph "><?FM MARKER [CaseNumber] FAR Case ####-###?> proposed for debarment, or voluntarily excluded, unless <?FM MARKER [Why] b. …?></ph>`


These markers enable developers to track and present FAR updates dynamically in their systems.

---

## **Fill-in Clauses in the FAR**

Certain FAR clauses require input from specific parties, categorized into three types:

* **Government Fill-In (GFI)**: Requires input from the Government Contracting Officer.  
* **Vendor Fill-in (VFI)**: Requires input from the Vendor.  
* **Editable Clauses (Editable)**: Allows the Contracting Officer to rewrite the clause per the prescription.

### **Marking Fill-ins in the DITA Map**

In the far.ditamap, fill-in types are specified in the xtrc attribute of \<topicref\> elements. Examples:

**GFI Only**:
`
<topicref navtitle="52.203-14 Display of Hotline Poster(s)." href="52.203-14.dita" xtrc="GFI"/>`

**GFI and Editable**:
`
<topicref navtitle="52.211-4 Availability for Examination of Specifications..." href="52.211-4.dita" xtrc="GFI Editable"/>`

**VFI Only**:  
`
<topicref navtitle="52.219-2 Equal Low Bids." href="52.219-2.dita" xtrc="VFI"/>`

The xtrc attribute can list multiple types, separated by spaces.

### **Marking Fill-ins in the Content**

Within FAR content, fill-in placeholders use the \<cite\> element, with the type in the xtrf attribute:

**Single Line GFI**:
`
<cite outputclass="SingleLine" xtrc="52.203-14\_d3058e138" xtrf="GFI">______________</cite>`

**Multi Line VFI**:
`
<cite outputclass="MultiLine" xtrc="52.204-8\_d1e843" xtrf="VFI">________________________</cite>`

**Checkbox VFI**:
`
<cite outputclass="Checkbox" xtrc="52.204-17_d73e51" xtrf="VFI">□</cite>`

The outputclass attribute defines the fill-in format (SingleLine, MultiLine, Checkbox), while xtrf specifies the type.

---

## **Incorporating FAR Content into Contract Writing Systems**

To integrate FAR content effectively, follow these steps:

**Parse the Structure**:

* **DITA Map**: Extract fill-in types from xtrc attributes to identify which clauses need input and from whom.  
* **Content**: Locate \<cite\> elements and their xtrf attributes to pinpoint fill-in placeholders.

 **Handle Fill-ins**:

* **GFI**: Build interfaces for Government Contracting Officers to enter data.  
* **VFI**: Create vendor-facing forms for data input.  
* **Editable**: Enable text modification by Contracting Officers, adhering to prescriptions.

**Track Updates**:

* Use rev attributes to highlight or filter changes by FAC.  
* Leverage LSA markers for detailed change logs or compliance reports.

**Ensure Compliance**:

* Validate that fill-ins are completed by the correct party.  
* Regularly update the system with the latest FACs to reflect current regulations.

This approach ensures your system is both functional and compliant with FAR requirements.

---

## Example Scenario

Imagine a contract writing system generating a contract with clause **52.203-14**, which includes a GFI:

1. **Parsing**: The system reads the DITA map, noting xtrc="GFI" for 52.203-14.  
2. **Content Check**: It finds `<cite outputclass="SingleLine" xtrf="GFI">______________</cite>` in the clause text.  
3. **User Interaction**: The system prompts the Government Contracting Officer to fill in the blank.  
4. **Output**: After input (e.g., “Inspector General Hotline”), the system replaces the placeholder in the final contract.

For a **VFI** clause, the process would shift to prompt the Vendor instead. This workflow showcases how metadata drives automation in contract creation.