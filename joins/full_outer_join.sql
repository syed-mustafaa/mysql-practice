-- ============================================================
-- Topic: FULL OUTER JOIN in MySQL
-- ============================================================
-- MySQL does NOT support FULL OUTER JOIN directly.
-- The standard workaround is UNION of LEFT JOIN + RIGHT JOIN.

-- Tables used: employees, departments (same as previous examples)

-- ============================================================
-- Example: FULL OUTER JOIN
-- ============================================================
-- Get ALL employees AND ALL departments, matched where possible.
-- Unmatched employees show NULL for department_name.
-- Unmatched departments show NULL for employee columns.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

UNION

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- Expected Output:
-- Alice, Bob, Carol, Eve  -> show their departments (matched rows)
-- Dave Brown              -> department_name = NULL  (employee with no dept)
-- Marketing               -> employee columns = NULL  (dept with no employees)

-- Interview Tip:
-- FULL OUTER JOIN = LEFT JOIN + RIGHT JOIN combined via UNION.
-- Use UNION (not UNION ALL) to remove duplicate matched rows.
