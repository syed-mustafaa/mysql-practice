-- Topic: Basic SELECT Problems (Practice)
-- Solve these using a standard employees/departments schema
-- Schema used throughout:
--
-- employees(employee_id, first_name, last_name, email, salary, department_id, hire_date, manager_id)
-- departments(department_id, department_name, location)

-- ============================================
-- Problem 1: Display All Employees
-- ============================================
-- Write a query to display all records from the employees table.

-- Solution:
SELECT * FROM employees;


-- ============================================
-- Problem 2: Display Only Names and Salary
-- ============================================
-- Retrieve only the first name, last name, and salary of all employees.

-- Solution:
SELECT first_name, last_name, salary
FROM employees;


-- ============================================
-- Problem 3: Display Unique Department IDs
-- ============================================
-- Find all unique department IDs from the employees table.

-- Solution:
SELECT DISTINCT department_id
FROM employees;


-- ============================================
-- Problem 4: Full Name as Alias
-- ============================================
-- Display each employee's full name (first + last) as a single column called 'full_name'.

-- Solution:
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;


-- ============================================
-- Problem 5: Annual Salary
-- ============================================
-- Display employee name and their annual salary (monthly salary × 12).

-- Solution:
SELECT 
    first_name,
    last_name,
    salary AS monthly_salary,
    salary * 12 AS annual_salary
FROM employees;


-- ============================================
-- Problem 6: Filter by Salary
-- ============================================
-- Find all employees who earn more than 50,000.

-- Solution:
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000;


-- ============================================
-- Problem 7: Filter by Department
-- ============================================
-- Display employees who belong to department_id = 10.

-- Solution:
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = 10;


-- ============================================
-- Problem 8: Salary Range
-- ============================================
-- Find employees with salary between 30,000 and 60,000.

-- Solution:
SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 30000 AND 60000;


-- ============================================
-- Problem 9: Sort by Salary (Descending)
-- ============================================
-- Display all employees sorted by salary from highest to lowest.

-- Solution:
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;


-- ============================================
-- Problem 10: Top 5 Highest Paid Employees
-- ============================================
-- Retrieve the top 5 highest paid employees.

-- Solution:
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- ============================================
-- Problem 11: Employees Without a Manager
-- ============================================
-- Find employees who have no manager (manager_id is NULL).

-- Solution:
SELECT first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;


-- ============================================
-- Problem 12: Names Starting with a Vowel
-- ============================================
-- Display employees whose first name starts with a vowel (A, E, I, O, U).

-- Solution:
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'A%'
   OR first_name LIKE 'E%'
   OR first_name LIKE 'I%'
   OR first_name LIKE 'O%'
   OR first_name LIKE 'U%';


-- ============================================
-- Problem 13: Count Total Employees
-- ============================================
-- How many employees are in the company?

-- Solution:
SELECT COUNT(*) AS total_employees
FROM employees;


-- ============================================
-- Problem 14: Average, Min, and Max Salary
-- ============================================
-- Find the average, minimum, and maximum salary in the company.

-- Solution:
SELECT 
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees;


-- ============================================
-- Problem 15: Employees Hired in 2023
-- ============================================
-- Display employees who were hired in the year 2023.

-- Solution:
SELECT first_name, last_name, hire_date
FROM employees
WHERE YEAR(hire_date) = 2023;
