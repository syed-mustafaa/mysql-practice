-- Topic: FOREIGN KEY Constraint
-- A FOREIGN KEY is used to prevent actions that would destroy links between tables.
-- It is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

-- ============================================
-- 1. FOREIGN KEY during Table Creation
-- ============================================

-- Parent Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Child Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    -- Define the Foreign Key
    CONSTRAINT fk_dept 
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- ============================================
-- 2. ON DELETE & ON UPDATE Actions
-- ============================================

-- CASE A: CASCADE (Delete/Update child when parent is deleted/updated)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- CASE B: SET NULL (Set child field to NULL when parent is deleted)
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
    ON DELETE SET NULL
);

-- CASE C: RESTRICT/NO ACTION (Default: Prevent deletion of parent if child exists)
-- (This is the default behavior if not specified)


-- ============================================
-- 3. Add FOREIGN KEY to Existing Table
-- ============================================

ALTER TABLE employees
ADD CONSTRAINT fk_dept_new
FOREIGN KEY (dept_id) REFERENCES departments(dept_id);


-- ============================================
-- 4. Drop a FOREIGN KEY Constraint
-- ============================================

ALTER TABLE employees
DROP FOREIGN KEY fk_dept_new;


-- ============================================
-- 5. Referential Integrity Rules
-- ============================================
-- 1. You cannot insert a value in the child table that doesn't exist in the parent table.
-- 2. You cannot delete a record from the parent table if matched records exist in the child table (unless using CASCADE).
-- 3. Both columns must have the exact same data type.
-- 4. The parent column MUST be indexed (usually is the Primary Key).
