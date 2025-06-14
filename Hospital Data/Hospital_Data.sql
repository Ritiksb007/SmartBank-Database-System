CREATE TABLE public.Patient_Records (
    Patient_ID SERIAL PRIMARY KEY,
    Full_Name TEXT,
    Age INT,
    Gender TEXT,
    Contact TEXT,
    Address VARCHAR,
    Emergency_Contact TEXT,
    Insurance BOOLEAN, 
    Insurance_Provider TEXT,
    Insurance_Number TEXT,
    Allergies TEXT,
    Current_Medications TEXT,
    Pre_existing_Conditions TEXT,
    Chief_Complaint TEXT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Final_Diagnosis TEXT,
    Treatment_Cost DECIMAL(10,2),
    Follow_up_Appointment DATE,
    Discharge_Summary TEXT
);


COPY public.patient_records
FROM 'Full_Patient_Data.csv'
DELIMITER ','
CSV HEADER;

select * from public.Patient_Records order by patient_id asc;

-- Count number of rows
select count(patient_id) as Total_No_Of_Colums from public.patient_records;

-- Updating Full Name to Caps
update public.patient_records
set full_name = INITCAP(Full_Name);

select * from public.Patient_Records order by patient_id asc;

-- Updating current_medications to Caps
update public.patient_records
set current_medications = INITCAP(current_medications);

select * from public.Patient_Records order by patient_id asc;

-- Updating pre_existing_conditions to Caps
update public.patient_records
set pre_existing_conditions = INITCAP(pre_existing_conditions);

select * from public.Patient_Records order by patient_id asc;

-- Updating chief_complaint to Caps
update public.patient_records
set chief_complaint = INITCAP(chief_complaint);

select * from public.Patient_Records order by patient_id asc;


-- -- Updating chief_complaint to Caps
update public.patient_records
set allergies = INITCAP(allergies);

select * from public.Patient_Records order by patient_id asc;

SELECT Full_Name, Age, Gender, COUNT(*)
FROM public.Patient_Records
GROUP BY Full_Name, Age, Gender
HAVING COUNT(*) > 1;

SELECT * 
FROM public.Patient_Records
WHERE Full_Name IS NULL 
   OR Age IS NULL 
   OR Gender IS NULL 
   OR Contact IS NULL 
   OR Admission_Date IS NULL;


SELECT * 
FROM public.Patient_Records
WHERE Age < 0 OR Age > 120;


SELECT DISTINCT Gender 
FROM public.Patient_Records;


SELECT * 
FROM public.Patient_Records
WHERE Discharge_Date < Admission_Date;


SELECT * 
FROM public.Patient_Records
WHERE Treatment_Cost < 0;