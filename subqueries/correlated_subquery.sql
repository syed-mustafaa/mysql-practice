-- Problem:
-- Use correlated subqueries where inner query references outer query

-- ============================================
-- Example 1: Basic correlated subquery
-- ============================================
-- Find employees earning above their department average
SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================
-- Example 2: EXISTS with correlated subquery
-- ============================================
-- Find employees who are managers (have subordinates)
SELECT 
    e.first_name,
    e.last_name,
    e.employee_id
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees
    WHERE manager_id = e.employee_id
);

-- ============================================
-- Example 3: NOT EXISTS
-- ============================================
-- Find departments with no employees
SELECT 
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- ============================================
-- Example 4: Correlated subquery in SELECT
-- ============================================
-- Show each employee with count of their subordinates
SELECT 
    e.first_name,
    e.last_name,
    (SELECT COUNT(*)
     FROM employees
     WHERE manager_id = e.employee_id) AS subordinate_count
FROM employees e;

-- ============================================
-- Example 5: Find nth highest value
-- ============================================
-- Find 3rd highest paid employee
SELECT 
    first_name,
    last_name,
    salary
FROM employees e1
WHERE 2 = (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e2.salary > e1.salary
);

-- ============================================
-- Example 6: Correlated DELETE (use with caution!)
-- ============================================
-- Example: Delete duplicate records keeping only the first
-- (Conceptual - be careful with DELETE operations)
/*
DELETE FROM employees e1
WHERE employee_id NOT IN (
    SELECT MIN(employee_id)
    FROM employees e2
    WHERE e1.email = e2.email
    GROUP BY email
);
*/

-- Expected Output:
-- Correlated subqueries reference outer query columns
-- Executed once for each row in outer query
-- Useful for row-by-row comparisons and EXISTS checks
