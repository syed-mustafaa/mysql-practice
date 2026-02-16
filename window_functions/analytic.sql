-- Problem:
-- Use Analytic Window Functions to access data from other rows

-- ============================================
-- Example 1: LAG() - Previous Row
-- ============================================
-- Compare current salary with previous employee's salary (sorted by hire date)
SELECT 
    first_name,
    last_name,
    hire_date,
    salary,
    LAG(salary, 1, 0) OVER (ORDER BY hire_date) as prev_employee_salary,
    salary - LAG(salary, 1, 0) OVER (ORDER BY hire_date) as salary_diff
FROM employees;

-- ============================================
-- Example 2: LEAD() - Next Row
-- ============================================
-- Compare daily sales with next day's sales
-- (Assuming a daily_sales table exists)
/*
SELECT 
    sale_date,
    total_amount,
    LEAD(total_amount, 1) OVER (ORDER BY sale_date) as next_day_sales
FROM daily_sales;
*/

-- ============================================
-- Example 3: FIRST_VALUE()
-- ============================================
-- Compare employee salary with the highest salary in their department
SELECT 
    first_name,
    last_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) as highest_dept_salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) - salary as diff_from_highest
FROM employees;

-- ============================================
-- Example 4: LAST_VALUE() with Frame Clause
-- ============================================
-- Compare employee salary with lowest salary in department
-- Note: Default frame creates running total behavior, so we need creating full frame
SELECT 
    first_name,
    last_name,
    department_id,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as lowest_dept_salary
FROM employees;

-- ============================================
-- Example 5: Running Total (Cumulative Sum)
-- ============================================
-- Calculate cumulative salary cost for each department
SELECT 
    department_id,
    first_name,
    last_name,
    salary,
    SUM(salary) OVER (
        PARTITION BY department_id 
        ORDER BY hire_date
    ) as running_salary_total
FROM employees;

-- Expected Output:
-- Returns rows with values from previous/next/first/last rows in partition
-- Demonstrates intra-partition comparisons without self-joins
