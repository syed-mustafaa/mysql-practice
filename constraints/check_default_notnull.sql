-- Topic: NOT NULL, DEFAULT, and CHECK Constraints

-- ============================================
-- 1. NOT NULL Constraint
-- ============================================
-- Ensures that a column cannot have a NULL value.

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,  -- Required
    last_name VARCHAR(50) NOT NULL,   -- Required
    email VARCHAR(100)               -- Optional (NULL allowed)
);

-- Adding NOT NULL to existing column
ALTER TABLE members
MODIFY email VARCHAR(100) NOT NULL;


-- ============================================
-- 2. DEFAULT Constraint
-- ============================================
-- Provides a default value for a column when none is specified.

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Adding DEFAULT to existing column
ALTER TABLE products
ALTER status SET DEFAULT 'pending';

-- Dropping DEFAULT
ALTER TABLE products
ALTER status DROP DEFAULT;


-- ============================================
-- 3. CHECK Constraint
-- ============================================
-- Ensures that values in a column meet a specific condition.
-- (Supported in MySQL 8.0.16 and later)

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    age INT,
    grade_level INT,
    -- Range check
    CONSTRAINT chk_age CHECK (age >= 18),
    -- List check
    CONSTRAINT chk_grade CHECK (grade_level BETWEEN 1 AND 12)
);

-- Check with multiple columns
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    quantity INT,
    price_each DECIMAL(10,2),
    discount DECIMAL(10,2),
    -- Ensure discount isn't higher than total price
    CONSTRAINT chk_discount CHECK (discount < (quantity * price_each))
);

-- Adding CHECK to existing table
ALTER TABLE students
ADD CONSTRAINT chk_student_name CHECK (LENGTH(first_name) >= 2);

-- Dropping CHECK
ALTER TABLE students
DROP CHECK chk_age;


-- ============================================
-- Summary Table
-- ============================================
-- | Constraint | Purpose                                       |
-- |------------|-----------------------------------------------|
-- | NOT NULL   | Column cannot be empty                        |
-- | DEFAULT    | Automatic value if none provided              |
-- | CHECK      | Custom logical validation                     |
-- | UNIQUE     | No duplicate values allowed                   |
-- | PRIMARY KEY| Unique ID (NOT NULL + UNIQUE Combined)        |
-- | FOREIGN KEY| Links to another table (Referential Integrity)|
