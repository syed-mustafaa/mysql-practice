-- Problem:
-- Join a table to itself to find relationships within the same table

-- ============================================
-- Example 1: Find employees and their managers
-- ============================================
-- List all employees with their manager's name
SELECT 
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- ============================================
-- Example 2: Find employees in the same department
-- ============================================
-- Find pairs of employees working in the same department
SELECT 
    e1.first_name AS employee1,
    e2.first_name AS employee2,
    e1.department_id
FROM employees e1
INNER JOIN employees e2 
    ON e1.department_id = e2.department_id
    AND e1.employee_id < e2.employee_id  -- Avoid duplicates
ORDER BY e1.department_id;

-- ============================================
-- Example 3: Find employees with same salary
-- ============================================
-- Identify employees earning the same salary
SELECT 
    e1.first_name AS employee1,
    e1.last_name AS lastname1,
    e2.first_name AS employee2,
    e2.last_name AS lastname2,
    e1.salary
FROM employees e1
INNER JOIN employees e2 
    ON e1.salary = e2.salary
    AND e1.employee_id < e2.employee_id
ORDER BY e1.salary DESC;

-- ============================================
-- Example 4: Hierarchical query (manager levels)
-- ============================================
-- Show employee hierarchy: employee -> manager -> manager's manager
SELECT 
    emp.first_name AS employee,
    mgr1.first_name AS direct_manager,
    mgr2.first_name AS senior_manager
FROM employees emp
LEFT JOIN employees mgr1 ON emp.manager_id = mgr1.employee_id
LEFT JOIN employees mgr2 ON mgr1.manager_id = mgr2.employee_id;

-- ============================================
-- Example 5: Find employees hired in the same month
-- ============================================
-- Identify employees hired in the same month and year
SELECT 
    e1.first_name AS employee1,
    e2.first_name AS employee2,
    e1.hire_date
FROM employees e1
INNER JOIN employees e2 
    ON YEAR(e1.hire_date) = YEAR(e2.hire_date)
    AND MONTH(e1.hire_date) = MONTH(e2.hire_date)
    AND e1.employee_id < e2.employee_id
ORDER BY e1.hire_date;

-- Expected Output:
-- Demonstrates self-referencing relationships
-- Common in hierarchical data (org charts, categories)
-- Uses table aliases (e, m, e1, e2) to distinguish same table
