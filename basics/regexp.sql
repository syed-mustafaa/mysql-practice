-- Topic: REGEXP (Regular Expressions in MySQL)
-- REGEXP is used to search for patterns in strings (more powerful than LIKE)

-- ============================================
-- Basic Syntax
-- ============================================
-- SELECT column FROM table WHERE column REGEXP 'pattern';
-- Use REGEXP or RLIKE (both work the same way)

-- ============================================
-- Example 1: Match a specific word
-- ============================================
-- Find employees whose first name contains 'john' (case-insensitive by default)
SELECT first_name, last_name
FROM employees
WHERE first_name REGEXP 'john';

-- ============================================
-- Example 2: ^ (Starts with)
-- ============================================
-- Find employees whose name starts with 'A'
SELECT first_name, last_name
FROM employees
WHERE first_name REGEXP '^A';

-- ============================================
-- Example 3: $ (Ends with)
-- ============================================
-- Find employees whose name ends with 'n'
SELECT first_name, last_name
FROM employees
WHERE last_name REGEXP 'n$';

-- ============================================
-- Example 4: . (Any single character)
-- ============================================
-- Find names with any character between 'J' and 'n'
SELECT first_name
FROM employees
WHERE first_name REGEXP 'J.n';

-- ============================================
-- Example 5: | (OR - match either pattern)
-- ============================================
-- Find employees from 'Sales' or 'IT' department names
SELECT department_name
FROM departments
WHERE department_name REGEXP 'Sales|IT|Finance';

-- ============================================
-- Example 6: [] (Character class)
-- ============================================
-- Find names starting with A, B, or C
SELECT first_name
FROM employees
WHERE first_name REGEXP '^[ABC]';

-- Find names containing any digit
SELECT first_name
FROM employees
WHERE first_name REGEXP '[0-9]';

-- ============================================
-- Example 7: [^] (Negation - NOT in class)
-- ============================================
-- Find email addresses that do NOT contain digits
SELECT email
FROM employees
WHERE email REGEXP '^[^0-9]+$';

-- ============================================
-- Example 8: * (Zero or more) and + (One or more)
-- ============================================
-- Find phone numbers with optional dashes
SELECT phone
FROM employees
WHERE phone REGEXP '^[0-9]{10}$';  -- exactly 10 digits

-- Find names with one or more vowels in a row
SELECT first_name
FROM employees
WHERE first_name REGEXP '[aeiou]+';

-- ============================================
-- Example 9: {n} (Exact repetition)
-- ============================================
-- Find zip codes that are exactly 6 digits
SELECT zip_code
FROM addresses
WHERE zip_code REGEXP '^[0-9]{6}$';

-- Find names between 4 and 8 characters long
SELECT first_name
FROM employees
WHERE first_name REGEXP '^[a-zA-Z]{4,8}$';

-- ============================================
-- Example 10: Validate email format
-- ============================================
-- Basic email format validation
SELECT email
FROM employees
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';

-- ============================================
-- REGEXP vs LIKE (Quick Comparison)
-- ============================================
-- LIKE:   WHERE name LIKE 'A%'       -- Starts with A (simple)
-- REGEXP: WHERE name REGEXP '^A'     -- Starts with A (same, but supports more)

-- LIKE:   WHERE name LIKE '%son%'    -- Contains 'son'
-- REGEXP: WHERE name REGEXP 'son'    -- Contains 'son' (same result)

-- REGEXP: WHERE name REGEXP 'son|man|girl' -- Contains any of these (NOT possible in LIKE)

-- Key Points:
-- 1. REGEXP is case-insensitive by default in MySQL
-- 2. Use REGEXP BINARY for case-sensitive matching
-- 3. REGEXP is slower than LIKE for simple patterns (use LIKE when possible)
-- 4. REGEXP is powerful for validation (email, phone, zip codes)
-- 5. Special characters: ^ $ . | [] [^] * + {n}
