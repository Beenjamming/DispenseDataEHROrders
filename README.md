# SnapPaper — EMR to Pharmacy Matching (Supplemental)

Simple supplemental repo containing a Pseudo-SQL example and ERD notes showing how to join EMR medication orders to external pharmacy dispense records.

## Files
- PseudoSQL.sql
- ERD.drawio
- ERD.png
- SampleMNedicationDataLoad.ipynb

## Purpose
Demonstrates a pragmatic matching strategy:
- Prefer direct `Order_ID` matches.
- Fallback to composite matching by patient, medication (or generic), provider NPI, and pharmacy identifiers.

## Usage
- Open [SampleMedicationDataLoad.ipynb] to test and understand the matching logic.
- Modify [PseudoSQL.sql] to fit your EMR database ERD. 
- Run against your database (SQL Server / compatible engine).

## Zenodo
[![DOI](https://zenodo.org/badge/1121410347.svg)](https://doi.org/10.5281/zenodo.21479397)
Dispense Data EHR Orders
