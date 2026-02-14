-- Problem:
-- Sort query results using ORDER BY clause

-- ============================================
-- Example 1: Sort by single column (ascending)
-- ============================================
-- List employees ordered by salary (lowest to highest)
SELECT 
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary ASC;

-- ============================================
-- Example 2: Sort by single column (descending)
-- ============================================
-- List employees ordered by salary (highest to lowest)
SELECT 
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;

-- ============================================
-- Example 3: Sort by multiple columns
-- ============================================
-- Sort by department, then by salary within each department
SELECT 
    department_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY department_id ASC, salary DESC;

-- ============================================
-- Example 4: Sort by column alias
-- ============================================
-- Calculate and sort by annual salary
SELECT 
    first_name,
    last_name,
    salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- ============================================
-- Example 5: Sort with LIMIT
-- ============================================
-- Get top 5 highest paid employees
SELECT 
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- ============================================
-- Example 6: Sort with LIMIT and OFFSET (pagination)
-- ============================================
-- Get employees 11-20 when sorted by salary
SELECT 
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 10 OFFSET 10;

-- Expected Output:
-- Sorted employee records in specified order
-- Demonstrates ORDER BY with LIMIT for pagination
