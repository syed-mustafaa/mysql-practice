-- ============================================================
-- Topic: LEFT JOIN, RIGHT JOIN, and CROSS JOIN Examples
-- ============================================================
-- These are fundamental JOIN types asked frequently in interviews.
-- Tables used: employees, departments, projects

-- ============================================================
-- SETUP: Sample Tables (run once to create & populate)
-- ============================================================

CREATE TABLE IF NOT EXISTS departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    salary        DECIMAL(10,2),
    department_id INT   -- FK to departments (may be NULL)
);

CREATE TABLE IF NOT EXISTS projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(50)
);

-- Sample data
INSERT INTO departments VALUES (1,'Engineering'),(2,'Sales'),(3,'HR'),(4,'Marketing');

INSERT INTO employees VALUES
  (1,'Alice','Smith',  80000, 1),
  (2,'Bob',  'Jones',  60000, 2),
  (3,'Carol','White',  70000, 1),
  (4,'Dave', 'Brown',  50000, NULL),   -- no department assigned
  (5,'Eve',  'Davis',  90000, 1);

INSERT INTO projects VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma');

-- ============================================================
-- Example 1: LEFT JOIN
-- ============================================================
-- Return ALL employees, and their department name if it exists.
-- Employees with no department show NULL in department_name.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name       -- NULL when no matching department
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;

-- Expected: Dave Brown appears with NULL department_name

-- ============================================================
-- Example 2: Find unmatched rows with LEFT JOIN
-- ============================================================
-- Employees who are NOT assigned to any department

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Expected: Only Dave Brown

-- ============================================================
-- Example 3: RIGHT JOIN
-- ============================================================
-- Return ALL departments, and employees in them (if any).
-- Departments with no employees show NULL for employee columns.

SELECT
    d.department_name,
    e.first_name,
    e.last_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;

-- Expected: Marketing department appears with NULL employee columns

-- ============================================================
-- Example 4: Find departments with NO employees (RIGHT JOIN)
-- ============================================================

SELECT
    d.department_id,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- Expected: Marketing (department_id = 4)

-- ============================================================
-- Example 5: CROSS JOIN
-- ============================================================
-- Produces the Cartesian product of two tables.
-- Every row from employees is paired with every row from projects.
-- Use case: scheduling, combinations, test-data generation.

SELECT
    e.first_name,
    e.last_name,
    p.project_name
FROM employees e
CROSS JOIN projects p
ORDER BY e.employee_id, p.project_id;

-- Expected: 5 employees × 3 projects = 15 rows total

-- ============================================================
-- Interview Tips
-- ============================================================
-- LEFT JOIN  : All rows from LEFT  table; NULL where no match on RIGHT.
-- RIGHT JOIN : All rows from RIGHT table; NULL where no match on LEFT.
-- CROSS JOIN : Every combination (no ON clause needed / used).
-- INNER JOIN : Only rows where both sides have a match.
