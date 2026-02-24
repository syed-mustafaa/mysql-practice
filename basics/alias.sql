-- Topic: MySQL Aliases (AS)
-- Aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.

-- ============================================
-- 1. Column Aliases
-- ============================================

-- Syntax:
-- SELECT column_name [AS] alias_name FROM table_name;

-- Note: The 'AS' keyword is optional, but recommended for clarity.

-- Example: Renaming columns for better readability
SELECT 
    first_name AS "First Name",
    last_name AS "Last Name",
    salary AS income
FROM employees;

-- Example: Alias for calculated fields (CRITICAL USE CASE)
SELECT 
    first_name,
    salary,
    salary * 0.10 AS tax_deduction,
    salary * 1.15 AS projected_salary
FROM employees;

-- Example: Using Aliases with functions
SELECT 
    COUNT(employee_id) AS total_staff,
    AVG(salary) AS average_pay,
    MAX(salary) AS highest_salary
FROM employees;


-- ============================================
-- 2. Table Aliases
-- ============================================

-- Syntax:
-- SELECT column_name FROM table_name [AS] alias_name;

-- Table aliases are mostly used when working with multiple tables (JOINS).

-- Example: Simple table alias
SELECT 
    e.first_name, 
    e.last_name, 
    e.salary
FROM employees AS e;

-- Example: Table alias in a JOIN (Essential for readability)
SELECT 
    emp.first_name,
    emp.last_name,
    dept.department_name
FROM employees emp
JOIN departments dept ON emp.department_id = dept.department_id;


-- ============================================
-- 3. Advanced Rules & Limitations
-- ============================================

-- A. Using Aliases in WHERE Clause (NOT ALLOWED)
-- Standard SQL does not allow using column aliases in WHERE clauses 
-- because the WHERE clause is evaluated BEFORE the SELECT list.

/* 
-- THIS WILL FAIL:
SELECT first_name AS name
FROM employees
WHERE name = 'John'; 
*/

-- B. Using Aliases in ORDER BY (ALLOWED)
-- The ORDER BY clause is evaluated AFTER the SELECT list, 
-- so you CAN use aliases here.
SELECT 
    first_name,
    salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- C. Using Aliases in GROUP BY & HAVING (ALLOWED in MySQL)
-- While standard SQL varies, MySQL allows aliases in GROUP BY and HAVING.
SELECT 
    department_id,
    AVG(salary) AS avg_sal
FROM employees
GROUP BY department_id
HAVING avg_sal > 50000;


-- ============================================
-- Summary Tips
-- ============================================
-- 1. Use double quotes "Alias Name" if the alias contains spaces.
-- 2. Use table aliases (e, d, p) to keep JOIN queries concise.
-- 3. Aliases are crucial for naming columns in 'UNION' queries.
-- 4. Aliases help when using different tables with the SAME column names.
