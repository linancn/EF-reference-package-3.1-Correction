# EF Reference Package Change Log

_All entries reflect commits that touch the `EF-Reference-Package` directory._

## 2025-11-13
- Standardised the `shortDescription` for 28 energy-related flow XMLs from "Radioactivity" to "Net calorific value" to match the property that is actually expressed.
- Updated `EF-Reference-Package/ILCD/lciamethods/b2ad6110-c78d-11e6-9d9d-cec0c932ce01.xml` so the impact method metadata stays aligned with the renamed flow property.

## 2025-09-19
- Normalised four LCIA method names (files `01500b74…`, `9ec743ea…`, `dacd48b5…`, `fd530f00…`) to follow the current naming convention, preventing duplicate or ambiguous labels in downstream tooling.

## 2025-09-02
- Added the missing Chinese translation string for 25 LCIA method definitions so bilingual UIs can render the "impact category" label consistently.

## 2025-06-06
- Reassigned the emissions category metadata for four elementary flows (carbon, phosphorus, silicon and oil) so they map to the correct impact pathway in EF calculations.

## 2024-09-29
- Initial import of the EF Reference Package datasets, including the complete ILCD flows, flow properties, categories, documents and supporting references.
