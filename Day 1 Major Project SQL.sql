/* CREATE DATABASE "SmartBank"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;*/

-- 1) Creating Schema CustomerAccount
CREATE SCHEMA CustomerAccount
    AUTHORIZATION postgres;

-- 2) Creating Schema Customer_Offerings
CREATE SCHEMA Customer_Offerings
    AUTHORIZATION postgres;

-- 3) Creating Schema Branch_Operations
CREATE SCHEMA Branch_Operations
    AUTHORIZATION postgres;

-- 1) Creating Customers Table
create table CustomerAccount.Customer
(Customer_ID int primary key, 
Customer_Name varchar(100) not null,
Customer_Address varchar(100) not null,
Phone_Number char(10) unique not null,
Customer_Email varchar(100) unique,
Customer_DOB date not null,
Customer_NationalID varchar(20) not null unique);

-- 2) Creating Accounts Table 
create table customeraccount.Accounts(
Account_ID int primary key,
Customer_ID int not null,
Account_Type varchar(20) not null,
Balance Decimal(15,2) not null,
Opening_Date Date,
Branch_Name Varchar(50)not null,
foreign key(Customer_ID) references customeraccount.customer(Customer_ID)
);

select * from customeraccount.Accounts;

-- 3) Creating Transactions Table 
create table customeraccount.Transactions(
Transaction_ID int primary key,
Account_ID int not null,
Transaction_Date Timestamp not null,
Transaction_Type varchar(30) not null,
Amount decimal(15,2) not null,
Transaction_Mode varchar(30) not null,
Remarks Varchar(100),
foreign key(Account_ID) References customeraccount.Accounts(Account_ID)
);

-- 4) Create Laons Table
create table customer_offerings.Loans(
Loan_ID int primary key,
Customer_ID int not null,
Loan_Type varchar(30) not null not null,
Loan_Amount decimal(15,2) not null,
Interest_Rate decimal(5,2) not null,
Start_Date Date not null,
End_Date Date not null,
foreign key(Customer_ID) references customeraccount.customer(customer_id)
);

-- 5) creating Table Branches
create table branch_operations.Branches(
Branch_ID int primary key,
Branch_Name varchar(100) Not Null,
City varchar(100),
States varchar(100),
Zip_Code bigint,
Manager_Name varchar(100),
Established_Date Date
);

-- 6) Creating Employee Table
create table branch_operations.Employees(
Employee_ID int primary key,
Employee_Name varchar(100),
Positions varchar(100) not null,
Branch_ID int not null,
Hire_Date date,
Salary decimal(15, 2) not null,
Contact_Number char(10) not null,
Email varchar(100),
foreign key(Branch_ID) references branch_operations.Branches(Branch_ID)
);

-- 7) Creating Product Table
create table customer_offerings.Products(
Product_ID int primary key,
Product_Name varchar(100) not null,
Product_Type varchar(100) not null,
Interest_Rate decimal(5,2) not null,
Minimum_Balance decimal(15,2) not null,
Bank_ID int not null,
Branch_ID int not null,
Launch_Date date,
foreign key(Branch_ID) references branch_operations.Branches(Branch_ID)
)

-- 8) Creating Documents Table 
create table customeraccount.Documents(
Document_ID int primary key,
Document_Type varchar(100),
Associated_With varchar(100) not null,
Associated_ID int not null,
Upload_Date date,
Expiry_Date date,
Verified Varchar(10) not null,
foreign key(Associated_ID) references customeraccount.customer(customer_id)
);

select * from customeraccount.documents;

-- 9) Creating Audit Logs table
create table Branch_Operations.Audit_Logs(
Log_ID int primary key,
Entity_Type varchar(50),
Employee_ID int not null,
Action_Type varchar(50),
User_ID int not null,
Date_Time timestamp,
foreign key(Employee_ID) references branch_operations.Employees(Employee_ID)
);

-- 10) Creating Cards Table
create table customeraccount.Cards(
Card_ID int Primary key,
Account_ID int not null,
Card_Type varchar(20)not null,
Card_Number varchar(16) not null,
Card_Expiry_Date date not null,
CVV char(3) not null,
Issued_Date date not null,
Card_Status Varchar(10) not null,
foreign key(Account_ID) References customeraccount.Accounts(Account_ID)
);

-- 11) Creating Insurance Table
create table customer_offerings.Insurance(
Policy_ID int primary key,
Customer_ID int not null,
Policy_Type varchar(20),
Premium_Amount decimal(15,2) not null,
Coverage_Amount decimal(15,2) not null,
Start_Date Date not null,
End_Date Date not null,
Policy_Status varchar(20),
foreign key(Customer_ID) references customeraccount.customer(customer_id)
);

















