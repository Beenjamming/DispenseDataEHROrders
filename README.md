# SnapPaper — EMR to Pharmacy Matching (Supplemental)

Simple supplemental repo containing a Pseudo-SQL example and ERD notes showing how to join EMR medication orders to external pharmacy dispense records.

## Files

## Key objects referenced (in [PseudoSQL.sql](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql))
- [`EMR_Medication_Orders`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- [`Dispense_History`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- [`Patient`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- [`Medication`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- [`Provider`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- [`Pharmacy`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)
- temp tables: [`#EMR_Medication_Orders_Details`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql), [`#Dispense_History_Details`](c:\Users\michaelsb\OneDrive - UCSF\Desktop\SnapPaper\PseudoSQL.sql)

## Purpose
Demonstrates a pragmatic matching strategy:
- Prefer direct `Order_ID` matches.
- Fallback to composite matching by patient, medication (or generic), provider NPI, and pharmacy identifiers.

## Usage
- Open [PseudoSQL.sql]
- Run against your database (SQL Server / compatible engine).
