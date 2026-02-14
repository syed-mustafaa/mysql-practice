-- Problem:
-- Basic SELECT queries to retrieve data from tables

-- ============================================
-- Example 1: Select all columns
-- ============================================
-- Retrieve all employee records
SELECT * 
FROM employees;

-- ============================================
-- Example 2: Select specific columns
-- ============================================
-- Get employee names and salaries
SELECT 
    first_name,
    last_name,
    salary
FROM employees;

-- ============================================
-- Example 3: Select with column aliases
-- ============================================
-- Display employee full name and annual salary
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary * 12 AS annual_salary
FROM employees;

-- ============================================
-- Example 4: Select distinct values
-- ============================================
-- Get unique department IDs
SELECT DISTINCT department_id
FROM employees;

-- ============================================
-- Example 5: Select with expressions
-- ============================================
-- Calculate employee age (assuming DOB column exists)
SELECT 
    first_name,
    last_name,
    YEAR(CURDATE()) - YEAR(date_of_birth) AS age
FROM employees;

-- Expected Output:
-- Returns employee records with calculated fields and aliases
-- Demonstrates fundamental SELECT operations
