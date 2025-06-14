-- 1) Queries on SQL Functions
-- Q1. Extract the year of birth for all customers using a date function. 
select customer_id,customer_name, to_char(customer_dob,'YYYY') from customeraccount.customer;

-- Q2. Convert customer names to uppercase. 
UPDATE customeraccount.customer
SET customer_name = UPPER(customer_name);
select customer_name from customeraccount.customer;

-- Q3. Concatenate the customer name and address into a single string. 
alter table customeraccount.customer
add column CName_CAddress varchar(200);

UPDATE customeraccount.customer
SET CName_CAddress = customer_name ||','||customer_address;

select cname_caddress from customeraccount.customer;

-- Q4. Find the length of the Customer_Email field. 
select customer_email, length(customer_email) as Email_Length from customeraccount.customer;


-- Q5. Replace all occurrences of ‘Downtown’ in branch names with ‘NewTown’.
select replace(branch_name, 'Downtown', 'NewTown') as modified_branch_name 
from branch_operations.branches;

-- select branch_name from branch_operations.branches;

-- Q6. Trim extra spaces from Manager_Name. 
select trim(manager_name) as Trim_Manager_Name from branch_operations.branches;

-- Q7. Calculate the difference in days between the start and end dates of all loans.
select loan_id, start_date, end_date, (end_date - start_date) as Days_Difference 
from customer_offerings.loans;




-- 2) Queries on Aggregate Function
-- Q1. Count the total number of customers.
select count(customer_id) as Total_Employee 
from customeraccount.customer;

-- Q2. Find the average balance in all accounts. 
select avg(balance) as Avg_Balance 
from customeraccount.accounts;

-- Q3. Get the sum of transaction amounts.
select sum(amount) as Sum_Transaction_Amount 
from customeraccount.transactions;

-- Q4. Calculate the minimum and maximum loan amounts.
select max(loan_amount) as Max_Loan_Amount, 
min(loan_amount) as Min_Loan_Amount
from customer_offerings.loans;

-- Q5. Find the number of employees in each branch.
select b.branch_name, count(e.employee_id) as Emp_Count 
from branch_operations.employees e
join branch_operations.branches b 
on e.branch_id = b.branch_id
group by b.branch_id;

-- Q6. Fetch the total number of branches in each city.
select branch_name, count(city) as City_Count 
from branch_operations.branches group by branch_name;

-- Q7. Calculate the average interest rate for loans.
select avg(interest_rate) as Avg_Interest_Rate
from customer_offerings.loans;

-- Q8. Count the number of insurance policies per customer. 
select policy_type, count(policy_type) as Policy_Count 
from customer_offerings.insurance group by policy_type; 


-- Joins
-- Q1. List all customers along with their accounts using an Inner Join. 
select c.customer_id ,c.customer_name, a.account_id, a.account_type, a.balance, a.branch_name
from customeraccount.customer c 
inner join customeraccount.accounts a 
on c.customer_id = a.customer_id
order by c.customer_id asc;
-- Q2. Fetch all employees and their respective branch details using an Inner Join.
select e.employee_id, e.employee_name, b.branch_id, b.branch_name
from branch_operations.employees e
inner join branch_operations.branches b 
on e.branch_id = b.branch_id;

-- Q3. Get a list of all branches and the products they offer (Left Join). 
select p.branch_id,b.branch_name, p.product_id, p.product_name
from branch_operations.branches b
left join customer_offerings.products p
on p.branch_id = b.branch_id;

-- Q4. List all accounts with their transactions using an Outer Join. 
select a.account_id, a.account_type, t.transaction_id, t.transaction_type
from customeraccount.accounts a
full outer join customeraccount.transactions t
on a.account_id = t.account_id;

-- Q5. Identify accounts that do not have any associated transactions (Full Outer Join). 
select a.account_id, a.customer_id, t.transaction_id
from customeraccount.accounts a
full outer join customeraccount.transactions t
on a.account_id = t.account_id 
where transaction_id is null;

-- Q6. Fetch all customers who have taken loans and their loan details (Left Join). 
select a.account_id, a.customer_id, l.loan_id, l.loan_type
from customeraccount.accounts a
left join customer_offerings.loans l
on a.customer_id = l.customer_id where loan_id is not null or l.loan_type is not null;

-- Q7. List employees earning more than the average salary of their branch (Self Join). 
select se.employee_id, e.employee_name
from branch_operations.employees e
join branch_operations.employees se
on e.employee_id = se.employee_id
where e.salary > (select avg(salary) from branch_operations.employees);

-- Q8. Fetch the branches and employees who were hired after 2020 (Inner Join).
select e.employee_id, e.employee_name, b.branch_name, e.hire_date
from branch_operations.employees e
inner join branch_operations.branches b
on e.branch_id = b.branch_id
where to_char(e.hire_date,'YYYY') >'2020' order by e.employee_id;

-- Subqueries
-- Q1. Find the customer with the highest account balance. 
select account_id, customer_id, balance
from customeraccount.accounts
where balance = (select max(balance) from customeraccount.accounts);

-- Q2. Fetch branches with an average salary greater than 70,000. 
select e.branch_id, b.branch_name, e.salary
from branch_operations.employees e
join branch_operations.branches b 
on e.branch_id = b.branch_id 
where (select avg(salary) from branch_operations.employees)>50000;

-- Chat GPT
SELECT b.branch_id, b.branch_name
FROM branch_operations.branches b
WHERE b.branch_id IN (
    SELECT e.branch_id
    FROM branch_operations.employees e
    GROUP BY e.branch_id
    HAVING AVG(e.salary) > 70000);

-- Q3. List accounts with a balance above the average for all accounts. 
select a.account_id,a.customer_id, a.balance from customeraccount.accounts a
where balance > (select avg(balance) from customeraccount.accounts);

-- Q4. Identify employees earning more than the maximum salary in another branch. 
select e.employee_id, e.salary, b.branch_name
from branch_operations.employees e 
join branch_operations.branches b 
on b.branch_id = e.branch_id
where e.salary > (select max(e2.salary)
    from branch_operations.employees e2
    join branch_operations.branches b2 
      on b2.branch_id = e2.branch_id
    where b2.branch_id != b.branch_id
)
order by b.branch_name, e.salary desc;

-- Q5. Fetch the names of branches offering the highest number of products. 
-- Chat GPT
SELECT b.branch_name, COUNT(p.product_id) AS product_count
FROM customer_offerings.products p
JOIN customer_offerings.branches b
  ON b.branch_id = p.branch_id
GROUP BY b.branch_id, b.branch_name
HAVING COUNT(p.product_id) = (
    SELECT MAX(product_count)
    FROM (
        SELECT COUNT(product_id) AS product_count
        FROM customer_offerings.products
        GROUP BY branch_id
    ) branch_product_counts
)
ORDER BY b.branch_name;

-- Q6. Find the branch with the most employees. 
select b.branch_id, b.branch_name 
from branch_operations.employees e
join branch_operations.branches b
on e.branch_id = b.branch_id
where 

-- Q7. Identify customers with the most transactions in their accounts. 
select c.customer_id, c.customer_name, count(transaction_id) as No_Of_Transaction
from customeraccount.customer c
join customeraccount.accounts a
on c.customer_id = a.customer_id
join customeraccount.transactions t
on a.account_id = t.account_id
-- where (select count(transaction_id)>2 from customeraccount.transactions)
group by c.customer_id;

-- Chat GPT
WITH CustomerTransactionCounts AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        COUNT(t.transaction_id) AS transaction_count
    FROM customeraccount.customer c
    JOIN customeraccount.accounts a
        ON c.customer_id = a.customer_id
    JOIN customeraccount.transactions t
        ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, transaction_count
FROM CustomerTransactionCounts
WHERE transaction_count = (
    SELECT MAX(transaction_count)
    FROM CustomerTransactionCounts
);