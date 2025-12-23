
-- Query to retrieve medication order details from the EMR_Medication_Orders table
select  Order_ID
        
        --Patient Info
        ,Patient.Patient_ID
        ,Patient.Name 
        ,Patient.Date_of_Birth

        --Medication Info
        ,Medication.Medication_ID
        ,Medication.Generic_ID
        ,Medication.Generic_Name

        --Provider Info
        ,Provider.Provider_ID
        ,Provider.NPI
        
        --Pharmacy Info
        ,Pharmacy.Pharmacy_ID
        ,Pharmacy.Pharmacy_Phone
        ,Pharmacy.Pharmacy_Nabp

into #EMR_Medication_Orders_Details

from EMR_Medication_Orders
left join Patient on EMR_Medication_Orders.Patient_ID = Patient.Patient_ID
left join Medication on EMR_Medication_Orders.Medication_ID = Medication.Medication_ID
left join Provider on EMR_Medication_Orders.Provider_ID = Provider.Provider_ID
left join Pharmacy on EMR_Medication_Orders.Pharmacy_ID = Pharmacy

--Query to pull external pharmacy dispense data 
select  History_ID
       
        --Order Info if available 
       ,Dispense_History.Order_ID

       --Patient Info
       ,Patient.Patient_ID
       ,Patient.Name 
       ,Patient.Date_of_Birth

       --Medication Info
       ,Medication.Medication_ID
       ,Medication.Generic_ID
       ,Medication.Generic_Name

       --Provider Info
       ,Provider.Provider_ID
       ,Provider.NPI

       --Pharmacy Info
       ,Pharmacy.Pharmacy_ID
       ,Pharmacy.Pharmacy_Phone
       ,Pharmacy.Pharmacy_Nabp

into #Dispense_History_Details
from Dispense_History


select *

from #EMR_Medication_Orders_Details
left join #Dispense_History_Details on #EMR_Medication_Orders_Details.Order_ID = #Dispense_History_Details.Order_ID --Best if can be used and is present in both tables.
    
    --For external pharmacies normally a single unique identifier for orders is not available so we can use a combination of other fields to try and match records.
    or (#EMR_Medication_Orders_Details.Patient_ID = #Dispense_History_Details.Patient_ID  --If patient ID is not available in the dispense history, a combination of patient name and dob can be used.
        and #EMR_Medication_Orders_Details.Medication_ID = #Dispense_History_Details.Medication_ID --This can be modifed to either Generic_ID or Generic_Name if needed depending on matching requirements.
        and #EMR_Medication_Orders_Details.Provider_NPI = #Dispense_History_Details.Provider_NPI 
        and #EMR_Medication_Orders_Details.Pharmacy_ID = #Dispense_History_Details.Pharmacy_ID) --If pharmacy ID is not available, a combination of pharmacy phone and/or nabp can be used.  
