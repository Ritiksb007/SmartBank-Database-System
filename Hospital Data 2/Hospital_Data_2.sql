CREATE TABLE public.administrative_support_services(
    Employee_ID BIGINT PRIMARY KEY,
    Department VARCHAR(100),
    Role VARCHAR(100),
    Salary NUMERIC(10,2),
    Experience_Years SMALLINT,
    Location VARCHAR(30),
    Date_of_Joining DATE
);

-- Data is imported using import function

select * from public.administrative_support_services;

CREATE TABLE public.surgical_department_data (
    Patient_Name VARCHAR(50),
    Address VARCHAR(100),
    Disease_Found VARCHAR(30),
    Cure VARCHAR(30),
    Medication VARCHAR(50),
    Assigned_Surgeon VARCHAR(50),
    Insurance VARCHAR(30),
    Cost_of_Surgery NUMERIC(10,2),
    Discharge_Date DATE,
    After_Treatment_Effect VARCHAR(50),
    Follow_Up VARCHAR(50)
);

select * from public.surgical_department_data;

-- Data Cleaning & Preprocessing
-- Handling Missing Values:
-- Some employee records might have missing values in fields such as Role, Salary, or Experience_Years. 
-- How can missing values be handled without losing essential data?
SELECT * FROM public.administrative_support_services 
WHERE Role IS NULL OR Salary IS NULL OR Experience_Years IS NULL;

-- Detecting and Removing Duplicates:
-- If duplicate employee records exist, how can we detect and remove them while ensuring no critical information is lost?
SELECT Employee_ID, COUNT(*) 
FROM public.administrative_support_services
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- Trimming Unnecessary Spaces:
-- Employee names and roles might have extra spaces before or after text (e.g., " System Administrator " instead of "System Administrator"). How can we efficiently clean and trim spaces?
UPDATE public.administrative_support_services
SET Department = TRIM(Department),
    Role = TRIM(Role),
    Location = TRIM(Location);

SELECT * FROM public.administrative_support_services order by employee_id asc;