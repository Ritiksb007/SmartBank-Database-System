CREATE TABLE Customer_Offerings.Loans (
    Loan_ID SERIAL PRIMARY KEY,
    Customer_ID INTEGER REFERENCES Customer_Account.Customers(Customer_ID),
    Loan_Type VARCHAR(20) CHECK (Loan_Type IN ('Home', 'Education', 'Personal', 'Vehicle', 'Car', 'Business')),
    Loan_Amount DECIMAL(15, 2),
    Interest_Rate DECIMAL(5, 2),
    Start_Date DATE,
    End_Date DATE
);

CREATE TABLE Customer_Offerings.Insurance (
    Policy_ID SERIAL PRIMARY KEY,
    Customer_ID INTEGER REFERENCES Customer_Account.Customers(Customer_ID),
    Policy_Type VARCHAR(20) CHECK (Policy_Type IN ('Life', 'Health', 'Travel', 'Vehicle')),
    Premium_Amount DECIMAL(15, 2),
    Coverage_Amount DECIMAL(15, 2),
    Start_Date DATE,
    End_Date DATE,
    Policy_Status VARCHAR(20) CHECK (Policy_Status IN ('Active', 'Lapsed', 'Cancelled'))
);

CREATE TABLE Customer_Offerings.Products (
    Product_ID SERIAL PRIMARY KEY,
    Product_Name VARCHAR(100),
    Product_Type VARCHAR(50),
    Interest_Rate DECIMAL(5, 2),
    Minimum_Balance DECIMAL(15, 2),
    Bank_ID INTEGER,
    Branch_ID INTEGER,
    Launch_Date DATE
);

SELECT * FROM Customer_Offerings.Loans;
SELECT * FROM Customer_Offerings.Insurance;
SELECT * FROM Customer_Offerings.Products;

-- Loans Table:
INSERT INTO Customer_Offerings.Loans (Loan_ID, Customer_ID, Loan_Type, Loan_Amount, Interest_Rate, Start_Date, End_Date) 
VALUES
(1, 12, 'Home', 150000.00, 5.5, '2020-02-15', '2030-02-15'),
(2, 8, 'Car', 27000.00, 7.0, '2021-06-10', '2026-06-10'),
(3, 15, 'Personal', 18000.00, 9.5, '2022-08-01', '2025-08-01'),
(4, 3, 'Education', 50000.00, 6.0, '2019-09-20', '2029-09-20'),
(5, 10, 'Business', 85000.00, 8.0, '2021-03-15', '2028-03-15'),
(6, 5, 'Home', 190000.00, 4.8, '2020-07-10', '2035-07-10'),
(7, 17, 'Car', 35000.00, 7.2, '2022-11-20', '2027-11-20'),
(8, 20, 'Personal', 20000.00, 10.0, '2023-04-15', '2025-04-15'),
(9, 7, 'Business', 70000.00, 7.5, '2020-01-10', '2027-01-10'),
(10, 2, 'Education', 65000.00, 6.2, '2019-12-01', '2029-12-01'),
(11, 9, 'Home', 140000.00, 5.0, '2020-05-15', '2030-05-15'),
(12, 18, 'Personal', 15000.00, 9.8, '2022-07-10', '2025-07-10'),
(13, 6, 'Business', 95000.00, 7.5, '2021-01-20', '2028-01-20'),
(14, 22, 'Education', 48000.00, 6.3, '2020-02-05', '2030-02-05'),
(15, 11, 'Home', 220000.00, 5.3, '2019-06-15', '2034-06-15'),
(16, 25, 'Car', 33000.00, 7.1, '2021-09-10', '2026-09-10'),
(17, 30, 'Business', 100000.00, 8.2, '2020-10-20', '2027-10-20'),
(18, 4, 'Personal', 25000.00, 9.0, '2023-01-05', '2026-01-05'),
(19, 16, 'Education', 52000.00, 6.0, '2020-03-15', '2030-03-15'),
(20, 19, 'Home', 130000.00, 4.9, '2022-06-10', '2032-06-10'),
(21, 27, 'Car', 31000.00, 7.4, '2021-12-01', '2026-12-01'),
(22, 13, 'Business', 87000.00, 8.0, '2020-08-15', '2027-08-15'),
(23, 21, 'Personal', 18000.00, 9.5, '2023-03-20', '2025-03-20'),
(24, 14, 'Education', 51000.00, 6.1, '2019-11-15', '2029-11-15'),
(25, 1, 'Home', 180000.00, 5.4, '2020-04-10', '2035-04-10'),
(26, 23, 'Car', 26000.00, 7.0, '2021-01-20', '2026-01-20'),
(27, 29, 'Personal', 14000.00, 9.2, '2023-02-10', '2026-02-10'),
(28, 26, 'Business', 110000.00, 7.8, '2020-07-25', '2028-07-25'),
(29, 28, 'Education', 47000.00, 6.4, '2021-03-15', '2031-03-15'),
(30, 31, 'Home', 210000.00, 4.7, '2020-12-05', '2035-12-05'),
(31, 33, 'Car', 34000.00, 7.3, '2022-10-20', '2027-10-20'),
(32, 35, 'Business', 93000.00, 8.5, '2021-07-10', '2028-07-10'),
(33, 32, 'Personal', 21000.00, 9.7, '2023-01-25', '2025-01-25'),
(34, 24, 'Education', 50000.00, 6.2, '2020-02-15', '2030-02-15'),
(35, 36, 'Home', 160000.00, 5.2, '2019-08-01', '2034-08-01'),
(36, 38, 'Car', 40000.00, 7.6, '2021-11-20', '2026-11-20'),
(37, 20, 'Business', 85000.00, 8.1, '2020-03-15', '2027-03-15'),
(38, 37, 'Personal', 22000.00, 10.0, '2023-06-01', '2026-06-01'),
(39, 34, 'Education', 61000.00, 6.0, '2021-04-10', '2031-04-10'),
(40, 40, 'Home', 170000.00, 5.0, '2020-09-15', '2035-09-15'),
(41, 45, 'Home', 185000.00, 4.9, '2021-02-10', '2036-02-10'),
(42, 48, 'Car', 29000.00, 7.1, '2022-05-15', '2027-05-15'),
(43, 50, 'Personal', 22000.00, 9.4, '2023-07-10', '2026-07-10'),
(44, 43, 'Education', 54000.00, 6.3, '2020-09-15', '2030-09-15'),
(45, 53, 'Business', 95000.00, 8.0, '2021-06-20', '2028-06-20'),
(46, 41, 'Home', 200000.00, 5.1, '2019-03-10', '2034-03-10'),
(47, 57, 'Car', 37000.00, 7.5, '2022-10-15', '2027-10-15'),
(48, 60, 'Personal', 17000.00, 9.7, '2023-01-20', '2026-01-20'),
(49, 42, 'Education', 61000.00, 6.0, '2020-07-15', '2030-07-15'),
(50, 55, 'Business', 105000.00, 7.9, '2021-11-10', '2028-11-10'),
(51, 63, 'Home', 210000.00, 5.0, '2020-05-25', '2035-05-25'),
(52, 67, 'Car', 32000.00, 7.3, '2021-04-15', '2026-04-15'),
(53, 65, 'Personal', 19000.00, 9.6, '2022-08-01', '2025-08-01'),
(54, 46, 'Education', 58000.00, 6.2, '2019-10-10', '2029-10-10'),
(55, 62, 'Business', 88000.00, 8.3, '2020-12-20', '2027-12-20'),
(56, 44, 'Home', 150000.00, 4.8, '2021-01-15', '2036-01-15'),
(57, 71, 'Car', 25000.00, 7.4, '2023-06-15', '2028-06-15'),
(58, 73, 'Personal', 13000.00, 10.0, '2022-09-10', '2025-09-10'),
(59, 75, 'Education', 46000.00, 6.4, '2021-03-20', '2031-03-20'),
(60, 80, 'Business', 97000.00, 7.8, '2020-11-05', '2027-11-05');

SELECT * FROM Customer_Offerings.Loans;

-- Insurance Table:
INSERT INTO Customer_Offerings.Insurance 
    (Policy_ID, Customer_ID, Policy_Type, Premium_Amount, Coverage_Amount, Start_Date, End_Date, Policy_Status) 
VALUES
    (1, 2, 'Health', 1500.00, 200000.00, '2021-01-15', '2026-01-15', 'Active'),
    (2, 5, 'Life', 2500.00, 500000.00, '2020-03-10', '2030-03-10', 'Active'),
    (3, 10, 'Travel', 800.00, 50000.00, '2023-02-20', '2023-08-20', 'Lapsed'),
    (4, 12, 'Vehicle', 1200.00, 300000.00, '2021-07-01', '2026-07-01', 'Active'),
    (5, 15, 'Health', 1800.00, 250000.00, '2020-05-10', '2025-05-10', 'Active'),
    (6, 20, 'Life', 2000.00, 400000.00, '2019-09-15', '2029-09-15', 'Active'),
    (7, 25, 'Travel', 600.00, 75000.00, '2023-04-10', '2024-04-10', 'Active'),
    (8, 30, 'Vehicle', 1400.00, 250000.00, '2020-11-05', '2025-11-05', 'Active'),
    (9, 33, 'Life', 2200.00, 550000.00, '2022-01-15', '2032-01-15', 'Active'),
    (10, 35, 'Health', 1600.00, 200000.00, '2021-12-10', '2026-12-10', 'Active'),
    (11, 40, 'Travel', 700.00, 100000.00, '2023-06-01', '2024-06-01', 'Active'),
    (12, 42, 'Vehicle', 1300.00, 200000.00, '2020-10-05', '2025-10-05', 'Cancelled'),
    (13, 45, 'Life', 3000.00, 600000.00, '2018-07-15', '2028-07-15', 'Active'),
    (14, 50, 'Health', 1700.00, 250000.00, '2022-03-20', '2027-03-20', 'Active'),
    (15, 53, 'Travel', 900.00, 150000.00, '2023-05-12', '2024-05-12', 'Cancelled'),
    (16, 55, 'Vehicle', 1100.00, 280000.00, '2021-04-01', '2026-04-01', 'Active'),
    (17, 60, 'Life', 2800.00, 700000.00, '2020-12-20', '2030-12-20', 'Active'),
    (18, 63, 'Health', 1500.00, 200000.00, '2023-03-15', '2028-03-15', 'Active'),
    (19, 65, 'Travel', 750.00, 125000.00, '2022-11-10', '2023-11-10', 'Lapsed'),
    (20, 67, 'Vehicle', 1450.00, 220000.00, '2021-08-20', '2026-08-20', 'Active'),
    (21, 70, 'Life', 2400.00, 450000.00, '2019-05-15', '2029-05-15', 'Active'),
    (22, 72, 'Health', 1900.00, 300000.00, '2022-06-30', '2027-06-30', 'Active'),
    (23, 75, 'Travel', 850.00, 150000.00, '2023-01-05', '2024-01-05', 'Active'),
    (24, 78, 'Vehicle', 1350.00, 250000.00, '2021-11-15', '2026-11-15', 'Active'),
    (25, 80, 'Life', 2600.00, 500000.00, '2020-02-25', '2030-02-25', 'Active'),
    (26, 3, 'Health', 1800.00, 230000.00, '2022-08-18', '2027-08-18', 'Active'),
    (27, 6, 'Travel', 950.00, 120000.00, '2023-04-25', '2024-04-25', 'Active'),
    (28, 9, 'Vehicle', 1500.00, 350000.00, '2021-09-10', '2026-09-10', 'Active'),
    (29, 18, 'Life', 2100.00, 600000.00, '2020-07-15', '2030-07-15', 'Active'),
    (30, 22, 'Health', 1750.00, 250000.00, '2023-02-20', '2028-02-20', 'Active');

SELECT * FROM Customer_Offerings.Insurance;

-- Products Table:
INSERT INTO Customer_Offerings.Products (Product_ID, Product_Name, Product_Type, Interest_Rate, Minimum_Balance, Bank_ID, Branch_ID,
Launch_Date) VALUES
(1, 'Basic Savings Account', 'Savings Account', 1.5, 500, 1, 1, '2015-01-15'),
(2, 'Premium Savings Account', 'Savings Account', 2.0, 2000, 1, 2, '2016-03-20'),
(3, 'Standard Checking Account', 'Checking Account', 0.5, 0, 2, 3, '2014-07-10'),
(4, 'Gold Checking Account', 'Checking Account', 1.0, 1000, 2, 4, '2017-05-30'),
(5, 'Fixed Deposit 1 Year', 'Fixed Deposit', 5.0, 10000, 3, 5, '2018-11-15'),
(6, 'Fixed Deposit 3 Years', 'Fixed Deposit', 5.5, 15000, 3, 6, '2019-09-01'),
(7, 'Personal Loan', 'Loan', 10.0, NULL, 4, 7, '2020-02-12'),
(8, 'Home Loan', 'Loan', 8.5, NULL, 4, 8, '2021-04-25'),
(9, 'Auto Loan', 'Loan', 9.0, NULL, 5, 9, '2022-08-05'),
(10, 'Education Loan', 'Loan', 7.5, NULL, 5, 10, '2023-03-19'),
(11, 'Corporate Savings Account', 'Savings Account', 2.5, 5000, 6, 11, '2016-06-15'),
(12, 'Student Checking Account', 'Checking Account', 0.2, 0, 6, 12, '2018-08-10'),
(13, 'Recurring Deposit 1 Year', 'Recurring Deposit', 6.0, 1000, 7, 13, '2019-05-30'),
(14, 'Recurring Deposit 5 Years', 'Recurring Deposit', 6.5, 5000, 7, 14, '2020-01-20'),
(15, 'Gold Loan', 'Loan', 12.0, NULL, 8, 15, '2021-10-05'),
(16, 'Agricultural Loan', 'Loan', 6.0, NULL, 8, 16, '2022-12-01'),
(17, 'Overdraft Account', 'Credit', 15.0, 2000, 9, 17, '2017-03-15'),
(18, 'Credit Card Classic', 'Credit', 18.0, NULL, 9, 18, '2018-09-18'),
(19, 'Credit Card Platinum', 'Credit', 20.0, NULL, 10, 19, '2019-11-12'),
(20, 'Credit Card Gold', 'Credit', 22.0, NULL, 10, 20, '2020-07-05'),
(21, 'Senior Citizens Savings', 'Savings Account', 3.0, 1000, 11, 21, '2020-01-30'),
(22, 'Women Savings Account', 'Savings Account', 2.8, 1000, 11, 22, '2021-04-15'),
(23, 'Business Checking Account', 'Checking Account', 1.2, 5000, 12, 23, '2022-06-10'),
(24, 'Platinum Fixed Deposit', 'Fixed Deposit', 6.0, 20000, 12, 24, '2023-03-01'),
(25, 'Gold Recurring Deposit', 'Recurring Deposit', 7.0, 10000, 13, 25, '2021-09-10'),
(26, 'Startup Business Loan', 'Loan', 10.5, NULL, 13, 26, '2022-11-20'),
(27, 'Travel Loan', 'Loan', 11.0, NULL, 14, 27, '2023-05-30'),
(28, 'Holiday Savings Plan', 'Savings Account', 1.8, 500, 14, 28, '2019-12-15'),
(29, 'Young Saver Account', 'Savings Account', 2.0, 0, 15, 29, '2020-05-05'),
(30, 'Retirement Savings Plan', 'Savings Account', 3.2, 1000, 15, 30, '2021-02-25');


SELECT * FROM Customer_Offerings.Products;

-- Aggregate Tasks: 
-- 1. Find the total coverage amount for all ‘Active’ insurance policies:

SELECT SUM(Coverage_Amount) AS Total_Coverage
FROM Customer_Offerings.Insurance
WHERE Policy_Status = 'Active';

-- 2. Get the highest and lowest transaction amounts per mode:

SELECT Transaction_Mode, 
       MAX(Amount) AS Highest_Transaction, 
       MIN(Amount) AS Lowest_Transaction
FROM Customer_Account.Transactions
GROUP BY Transaction_Mode;

-- 3. Calculate the standard deviation for balances:

SELECT STDDEV(Balance) AS Balance_Standard_Deviation
FROM Customer_Account.Accounts;

-- 4. Find the median balance in accounts:

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Balance) AS Median_Balance
FROM Customer_Account.Accounts;

-- 5. Determine the mode of Transaction_Type:

SELECT Transaction_Type
FROM Customer_Account.Transactions
GROUP BY Transaction_Type
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 6. Calculate the total premium collected for each insurance type:

SELECT Policy_Type, 
       SUM(Premium_Amount) AS Total_Premium
FROM Customer_Offerings.Insurance
GROUP BY Policy_Type;

-- 7. Get the variance of loan amounts:

SELECT VARIANCE(Loan_Amount) AS Loan_Amount_Variance
FROM Customer_Offerings.Loans;

-- 8. Find the sum of all balances grouped by Account_Type:

SELECT Account_Type, 
       SUM(Balance) AS Total_Balance
FROM Customer_Account.Accounts
GROUP BY Account_Type;


