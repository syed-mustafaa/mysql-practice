-- Problem:
-- Use UNIQUE constraint to ensure column values are distinct

-- ============================================
-- Example 1: UNIQUE during table creation
-- ============================================
-- Ensure email addresses are unique
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- ============================================
-- Example 2: Multiple UNIQUE constraints
-- ============================================
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_code VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- ============================================
-- Example 3: Named UNIQUE constraint
-- ============================================
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_code VARCHAR(50),
    product_name VARCHAR(100),
    CONSTRAINT uq_product_code UNIQUE (product_code)
);

-- ============================================
-- Example 4: Composite UNIQUE constraint
-- ============================================
-- Combination of first_name + last_name must be unique
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    UNIQUE (first_name, last_name)
);

-- ============================================
-- Example 5: Add UNIQUE to existing table
-- ============================================
-- Add UNIQUE constraint after table creation
ALTER TABLE employees
ADD CONSTRAINT uq_employee_email UNIQUE (email);

-- ============================================
-- Example 6: Drop UNIQUE constraint
-- ============================================
-- Remove UNIQUE constraint
ALTER TABLE employees
DROP INDEX uq_employee_email;

-- ============================================
-- Example 7: UNIQUE with NULL handling
-- ============================================
-- UNIQUE allows multiple NULL values (in most databases)
INSERT INTO users (username, email) VALUES ('user1', NULL);
INSERT INTO users (username, email) VALUES ('user2', NULL);
-- Both inserts succeed because NULL != NULL in SQL

-- ============================================
-- Example 8: Test UNIQUE constraint violation
-- ============================================
-- This will fail if email already exists
-- INSERT INTO users (username, email) 
-- VALUES ('john_doe', 'existing@email.com');
-- Error: Duplicate entry 'existing@email.com' for key 'email'

-- Key Points:
-- 1. UNIQUE ensures no duplicate values (except NULL)
-- 2. Multiple UNIQUE constraints allowed per table
-- 3. NULL values are typically allowed (unlike PRIMARY KEY)
-- 4. Can be single column or composite
-- 5. Automatically creates an index
