-- Problem:
-- Use subqueries that return a single value (scalar)

-- ============================================
-- Example 1: Scalar subquery in SELECT
-- ============================================
-- Show employee salary and average salary
SELECT 
    first_name,
    last_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary,
    salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees;

-- ============================================
-- Example 2: Scalar subquery in WHERE
-- ============================================
-- Find employees with salary above average
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ============================================
-- Example 3: Multiple scalar subqueries
-- ============================================
-- Find employees with highest salary
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- ============================================
-- Example 4: Scalar subquery with JOIN condition
-- ============================================
-- Get department name for each employee using subquery
SELECT 
    e.first_name,
    e.last_name,
    (SELECT d.department_name 
     FROM departments d 
     WHERE d.department_id = e.department_id) AS department
FROM employees e;

-- ============================================
-- Example 5: Nested scalar subqueries
-- ============================================
-- Find employees earning more than 1.5x the minimum salary
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees) * 1.5;

-- ============================================
-- Example 6: Scalar subquery in HAVING
-- ============================================
-- Departments with average salary above company average
SELECT 
    department_id,
    AVG(salary) AS dept_avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

-- Expected Output:
-- Demonstrates scalar subqueries (return single value)
-- Can be used in SELECT, WHERE, HAVING clauses
-- Useful for comparisons with aggregated values
