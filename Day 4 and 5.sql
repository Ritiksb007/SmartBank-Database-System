-- 5. OVER Clause
-- Q1.	Assign row numbers to all customers in the Customer table.
select row_number() over (order by customer_id) as RowNumber, customer_id, customer_name
from customeraccount.customer;

-- Q2.	Rank employees based on their salary within each branch.
select employee_id, employee_name, salary, 
rank() over(partition by branch_id order by salary asc) as Rank_Emp 
from branch_operations.employees;

-- Q3. Calculate the cumulative total balance for all accounts, ordered by Opening_Date.
select account_id, customer_id, sum(balance) over(order by Opening_Date) as Comulative_Balance 
from customeraccount.accounts;

-- Q4. Assign a row number to each transaction for a given account.
select row_number() over (order by transaction_id) as RowNumber, transaction_id, account_id, transaction_date, transaction_type
from customeraccount.transactions;

-- Q5. Find the running total of transaction amounts for each account.
select account_id, transaction_id, transaction_date, amount,
sum(amount) over(partition by account_id order by transaction_id) as Running_Amount
from customeraccount.transactions;

-- Q6. Calculate the average salary within each branch using OVER.
select branch_id, avg(salary) over(partition by branch_id order by branch_id) as Avg_Sal 
from branch_operations.employees;


-- 6) RANK(), DENSE_RANK(), ROW_NUMBER()
-- 1. Assign row numbers to all branches based on their Established_Date. 
select row_number() over(order by established_date) as Established_Sequence,
branch_id, branch_name
from branch_operations.branches;

-- 2. Rank customers based on their total balance using RANK(). 
select rank() over(order by balance) as Bal_Rank, customer_id, account_id, balance
from customeraccount.accounts;

-- 3. Assign dense ranks to loans based on their Interest_Rate for each branch. 
select dense_rank() over(order by interest_rate) as Interest_Rate,loan_id, customer_id 
from customer_offerings.loans;

-- 4. Rank employees by their salary within their branch using DENSE_RANK().
select dense_rank() over(order by salary asc) as Most_Paid_Employee, employee_id, employee_name, salary
from branch_operations.employees;

-- 5. Assign row numbers to documents uploaded by each customer. 
select row_number() over(partition by document_type order by document_id) as document_number, document_id, document_type
from customeraccount.documents;

-- 6. Rank transactions based on their Transaction_Amount using RANK().
select rank() over(order by amount asc) as Transaction_Rank, transaction_id, account_id, amount
from customeraccount.transactions;

-- 7. Assign dense ranks to accounts based on their balance within each branch. 
select dense_rank() over(order by balance) as Rank_Balance, customer_id, account_id, balance
from customeraccount.accounts;

-- 8. Rank customers by the number of uploaded documents using DENSE_RANK().
-- Chat GPT
SELECT 
    DENSE_RANK() OVER (ORDER BY Document_Count DESC) AS No_Doc_Uploaded,
    Customer_ID,
    Document_Count
FROM(
    SELECT 
        Associated_ID AS Customer_ID,
        COUNT(Document_ID) AS Document_Count
    FROM customeraccount.Documents
    WHERE Associated_With = 'Customer'
    GROUP BY Associated_ID
)AS DocumentSummary;


7) Aggregate Functions with PARTITION BY 
-- 1. Calculate the total transaction amount for each account using PARTITION BY. 
select sum(amount) over(partition by account_id ) as Total_Transaction_Amount, transaction_id, account_id, amount, transaction_type
from customeraccount.transactions;

-- 2. Find the average loan amount partitioned by Loan_Type. 
select Avg(loan_amount) over(partition by loan_type) as Avg_Loan_Taken, customer_id
from customer_offerings.loans order by customer_id;

-- 3. Fetch the total salary for each branch using PARTITION BY. 
select sum(salary) over(partition by branch_id) as Total_Branch_Salary, branch_id, employee_id, employee_name
from branch_operations.employees;

-- 4. Calculate the total balance of accounts grouped by Branch_Name. 
select sum(balance) over(partition by branch_name) as Total_Balance, account_id, branch_name, account_type
from customeraccount.accounts order by account_id;

-- 5. Determine the maximum transaction amount for each Transaction_Type. 
select max(amount) over(partition by transaction_type) as MAx_Transaction_Amount, account_id, transaction_id
from customeraccount.transactions order by account_id;

-- 6. Find the total premium collected, partitioned by Insurance_Type. 
select sum(premium_amount) over(partition by policy_type) as Total_Premium, policy_id, customer_id
from customer_offerings.insurance order by policy_id;


-- 8) Data Dictionary and System Views
-- 1. List all tables in the database. 
select table_schema, table_name 
from information_schema.tables
where table_type = 'BASE TABLE' and table_schema not in ('information_schema', 'pg_catalog')
order by table_schema, table_name;

-- 2. Fetch the schema details for the Accounts table. 
SELECT 
    table_schema, 
    table_name, 
    column_name, 
    data_type, 
    is_nullable, 
    character_maximum_length
FROM 
    information_schema.columns
WHERE 
    table_name = 'accounts'
    AND table_schema = 'customeraccount';

-- 3. Find the column names and their data types for the Loans table. 
SELECT 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_name = 'loans'
    AND table_schema = 'customer_offerings';

-- 4. Retrieve all foreign keys defined in the database. 
SELECT 
    tc.constraint_name AS foreign_key_name,
    tc.table_schema,
    tc.table_name,
    kcu.column_name,
    ccu.table_schema AS referenced_table_schema,
    ccu.table_name AS referenced_table_name,
    ccu.column_name AS referenced_column_name
FROM 
    information_schema.table_constraints AS tc
JOIN 
    information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN 
    information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE 
    tc.constraint_type = 'FOREIGN KEY';

-- 5. Fetch the indexes applied to the Transactions table. 
SELECT 
    indexname AS index_name,
    indexdef AS index_definition
FROM 
    pg_indexes
WHERE 
    tablename = 'transactions'
    AND schemaname = 'customeraccount';
	
-- 6. List all schemas in the database. 
SELECT 
    schema_name
FROM 
    information_schema.schemata
ORDER BY 
    schema_name;



-- 9) Views 
-- 1. Create a view to list all customers and their account balances. 
CREATE VIEW View_Cust_List AS
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_Address,
    c.Phone_Number,
    c.Customer_Email,
    a.Account_ID,
    a.Account_Type,
    a.Balance,
    a.Branch_Name
FROM 
    customeraccount.Customer c
JOIN 
    customeraccount.Accounts a
    ON c.Customer_ID = a.Customer_ID;
-- 2. Create a view for transactions above a specified amount. CREATE VIEW EmployeeBranchDetails AS
SELECT 
    e.Employee_ID,
    e.Employee_Name,
    e.Positions,
    e.Salary,
    b.Branch_Name,
    b.City,
    b.Manager_Name
FROM 
    branch_operations.Employees e
JOIN 
    branch_operations.Branches b
    ON e.Branch_ID = b.Branch_ID;

-- 3. Fetch data from a view showing employees and their branch details. 
CREATE VIEW ActiveCustomerLoans AS
SELECT 
    l.Loan_ID,
    l.Customer_ID,
    l.Loan_Type,
    l.Loan_Amount,
    l.Interest_Rate,
    l.Start_Date,
    l.End_Date
FROM 
    customer_offerings.Loans l
JOIN 
    customeraccount.Customer c
    ON l.Customer_ID = c.Customer_ID;


-- 4. Create a view to display loan details for active customers only. 
CREATE OR REPLACE VIEW PolicyDetails AS
SELECT 
    Policy_ID,
    Customer_ID,
    Policy_Type,
    Premium_Amount,
    Coverage_Amount,
    Start_Date,
    End_Date,
    Policy_Status
FROM 
    customer_offerings.Insurance;
SELECT * FROM customeraccount.customer;

-- 6. Create a view for accounts with a balance below 1,000. 
CREATE VIEW LowBalanceAccounts AS
SELECT 
    Account_ID,
    Customer_ID,
    Balance,
    Account_Type,
    Branch_Name
FROM 
    customeraccount.Accounts
WHERE 
    Balance < 1000;
-- 10) Indexing 
-- 1. Create an index on Customer_Email in the Customers table. 
CREATE INDEX idx_Customer_Email ON customeraccount.Customer(Customer_Email);

-- 2. Create a unique index on Card_Number in the Cards table. 
CREATE UNIQUE INDEX idx_Card_Number ON customeraccount.Cards(Card_Number);

-- 3. Create a clustered index on Transaction_Date in the Transactions table. 
CREATE INDEX idx_Transaction_Date ON customeraccount.Transactions(Transaction_Date);

-- 4. Create a non-clustered index on Account_Type in the Accounts table. 
CREATE INDEX idx_Account_Type ON customeraccount.Accounts(Account_Type);

-- 5. Create a composite index on Branch_Name and City in the Branches table. 
CREATE INDEX idx_Branch_Name_City ON branch_operations.Branches(Branch_Name, City);

-- 6. Check the existing indexes on the Loans table. 
SELECT 
    indexname AS Index_Name,
    indexdef AS Index_Definition
FROM 
    pg_indexes
WHERE 
    tablename = 'loans'
    AND schemaname = 'customer_offerings';

