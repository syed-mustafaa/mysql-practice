-- Problem:
-- Use Window Functions for ranking rows based on specific criteria

-- ============================================
-- Example 1: ROW_NUMBER()
-- ============================================
-- Assign a unique number to each row within a partition
-- Useful for pagination or removing duplicates
SELECT 
    first_name,
    last_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) as salary_rank_row
FROM employees;

-- ============================================
-- Example 2: RANK()
-- ============================================
-- Rank employees by salary within their department
-- Skips numbers for ties (e.g., 1, 2, 2, 4)
SELECT 
    first_name,
    last_name,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as salary_rank
FROM employees;

-- ============================================
-- Example 3: DENSE_RANK()
-- ============================================
-- Rank employees by salary, no gaps in ranking numbers
-- Handles ties without skipping (e.g., 1, 2, 2, 3)
SELECT 
    first_name,
    last_name,
    department_id,
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as dense_salary_rank
FROM employees;

-- ============================================
-- Example 4: Top N per category
-- ============================================
-- Find top 3 highest paid employees in each department
SELECT * FROM (
    SELECT 
        first_name,
        last_name,
        department_id,
        salary,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as rank_in_dept
    FROM employees
) ranked_employees
WHERE rank_in_dept <= 3;

-- ============================================
-- Example 5: NTILE()
-- ============================================
-- Distribute rows into a specified number of groups
-- Example: Split employees into 4 quartiles based on salary
SELECT 
    first_name,
    last_name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) as salary_quartile
FROM employees;

-- Expected Output:
-- Returns rows with calculated rank/row number columns
-- Demonstrates differences between RANK, DENSE_RANK, and ROW_NUMBER
-- Explain NTILE usage for data distribution
