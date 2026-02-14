-- Problem:
-- Filter data using WHERE clause with various conditions

-- ============================================
-- Example 1: Simple WHERE condition
-- ============================================
-- Find employees with salary greater than 50000
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 50000;

-- ============================================
-- Example 2: Multiple conditions with AND
-- ============================================
-- Find employees in department 10 with salary > 40000
SELECT 
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE department_id = 10 
  AND salary > 40000;

-- ============================================
-- Example 3: Multiple conditions with OR
-- ============================================
-- Find employees in department 10 OR 20
SELECT 
    first_name,
    last_name,
    department_id
FROM employees
WHERE department_id = 10 
   OR department_id = 20;

-- ============================================
-- Example 4: IN operator
-- ============================================
-- Same as above, but using IN (cleaner syntax)
SELECT 
    first_name,
    last_name,
    department_id
FROM employees
WHERE department_id IN (10, 20, 30);

-- ============================================
-- Example 5: BETWEEN operator
-- ============================================
-- Find employees with salary between 30000 and 60000
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

-- ============================================
-- Example 6: LIKE operator (pattern matching)
-- ============================================
-- Find employees whose name starts with 'J'
SELECT 
    first_name,
    last_name
FROM employees
WHERE first_name LIKE 'J%';

-- ============================================
-- Example 7: IS NULL / IS NOT NULL
-- ============================================
-- Find employees without a manager (manager_id is NULL)
SELECT 
    first_name,
    last_name,
    manager_id
FROM employees
WHERE manager_id IS NULL;

-- Expected Output:
-- Filtered employee records based on various conditions
-- Demonstrates different WHERE clause operators
