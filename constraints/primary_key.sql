-- Problem:
-- Define PRIMARY KEY constraint to uniquely identify rows

-- ============================================
-- Example 1: PRIMARY KEY during table creation
-- ============================================
-- Create employees table with PRIMARY KEY
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- ============================================
-- Example 2: Composite PRIMARY KEY
-- ============================================
-- Create enrollment table with composite key
CREATE TABLE course_enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id)
);

-- ============================================
-- Example 3: AUTO_INCREMENT PRIMARY KEY
-- ============================================
-- Most common pattern - auto-generated ID
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- ============================================
-- Example 4: Add PRIMARY KEY to existing table
-- ============================================
-- Add PRIMARY KEY constraint after table creation
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

-- ============================================
-- Example 5: Named PRIMARY KEY constraint
-- ============================================
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    CONSTRAINT pk_products PRIMARY KEY (product_id)
);

-- ============================================
-- Example 6: Drop and recreate PRIMARY KEY
-- ============================================
-- Drop existing PRIMARY KEY
ALTER TABLE employees
DROP PRIMARY KEY;

-- Add new PRIMARY KEY
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

-- Key Points:
-- 1. PRIMARY KEY = NOT NULL + UNIQUE combined
-- 2. Only ONE PRIMARY KEY per table
-- 3. Can be composite (multiple columns)
-- 4. Usually used with AUTO_INCREMENT for surrogate keys
-- 5. Automatically creates an index for performance
