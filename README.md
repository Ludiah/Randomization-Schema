# Randomization Schema
This project generates unique patient identifiers by assigning a string of characters and numbers to track patients and their treatment status. 

* The format "AAA, BBB..." represents sequential sites
* "01, 02, 03..." represents patient numbers.
* A "T" or "C" suffix is appended to designate whether the patient is in the treatment or control group, randomly assigned to ensure unbiased classification.

This system facilitates efficient patient identification and status tracking for clinical trials or studies. 

In this reproducable code, the treatment to control ratio, number of subjects per site, and block size can be updated to customize each scenario.

### Example (with treatment to control 2:1) :
* Site 1: "AAA01T", "AAA02T", "AAA03C"...
* Site 2: "BBB01C", "BBB02T", "BBB03T"...
* Site 3: "CCC01T", "CCC02C", "CCC03T"...
