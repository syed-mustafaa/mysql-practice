-- Problem:
-- Find the department with the highest average salary

-- Schema:
/*
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
*/

-- Solution:
SELECT 
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- Expected Output:
-- Department name with the highest average salary

-------------------------------------------

-- Problem:
-- Find employees who have never taken leave

-- Schema:
/*
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE leave_records (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_date DATE,
    leave_type VARCHAR(50)
);
*/

-- Solution 1: Using NOT EXISTS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM leave_records lr
    WHERE lr.employee_id = e.employee_id
);

-- Solution 2: Using LEFT JOIN
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees e
LEFT JOIN leave_records lr ON e.employee_id = lr.employee_id
WHERE lr.leave_id IS NULL;

-- Expected Output:
-- Employees with no leave records

-------------------------------------------

-- Problem:
-- Find the top 3 products by sales in each category

-- Schema:
/*
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    total_sales DECIMAL(12, 2)
);
*/

-- Solution: Using window functions (MySQL 8+)
SELECT 
    category,
    product_name,
    total_sales,
    sales_rank
FROM (
    SELECT 
        category,
        product_name,
        total_sales,
        RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS sales_rank
    FROM products
) ranked
WHERE sales_rank <= 3;

-- Expected Output:
-- Top 3 products per category by sales

-------------------------------------------

-- Problem:
-- Find customers who made purchases in consecutive months

-- Schema:
/*
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    purchase_date DATE,
    amount DECIMAL(10, 2)
);
*/

-- Solution:
SELECT DISTINCT 
    p1.customer_id
FROM purchases p1
INNER JOIN purchases p2 
    ON p1.customer_id = p2.customer_id
    AND YEAR(p2.purchase_date) = YEAR(p1.purchase_date)
    AND MONTH(p2.purchase_date) = MONTH(p1.purchase_date) + 1;

-- Alternative using LAG() window function:
SELECT DISTINCT customer_id
FROM (
    SELECT 
        customer_id,
        purchase_date,
        LAG(purchase_date) OVER (PARTITION BY customer_id ORDER BY purchase_date) AS prev_date
    FROM purchases
) t
WHERE TIMESTAMPDIFF(MONTH, prev_date, purchase_date) = 1;

-- Expected Output:
-- Customer IDs who made purchases in consecutive months
