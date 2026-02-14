-- Problem:
-- Join two or more tables to combine related data using INNER JOIN

-- ============================================
-- Example 1: Basic INNER JOIN
-- ============================================
-- Get employee names with their department names
SELECT 
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- ============================================
-- Example 2: INNER JOIN with WHERE
-- ============================================
-- Get employees in 'Sales' department
SELECT 
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';

-- ============================================
-- Example 3: Multiple INNER JOINs
-- ============================================
-- Get employee, department, and location information
SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.country
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

-- ============================================
-- Example 4: INNER JOIN with aggregation
-- ============================================
-- Count employees in each department
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY employee_count DESC;

-- ============================================
-- Example 5: LEFT JOIN (for comparison)
-- ============================================
-- Get all departments, even if they have no employees
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Expected Output:
-- Combined data from multiple related tables
-- Only rows with matching keys in both tables (INNER JOIN)
-- All rows from left table (LEFT JOIN)
