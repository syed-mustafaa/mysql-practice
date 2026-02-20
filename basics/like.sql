-- Topic: LIKE Operator (Pattern Matching)
-- LIKE is used to search for a specified pattern in a column
-- Two wildcards: % (any sequence of characters), _ (any single character)

-- ============================================
-- Basic Syntax
-- ============================================
-- SELECT column FROM table WHERE column LIKE 'pattern';
-- %  → matches zero or more characters
-- _  → matches exactly one character

-- ============================================
-- Example 1: %a  →  Names ENDING with 'a'
-- ============================================
-- Find employees whose first name ends with 'a'
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%a';

-- Examples that match: Maria, Anna, Olivia, Emma, Lisa

-- ============================================
-- Example 2: a%  →  Names STARTING with 'a'
-- ============================================
-- Find employees whose first name starts with 'a' (case-insensitive)
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'a%';

-- Examples that match: Alice, Andrew, Adam, Ashley

-- ============================================
-- Example 3: %a%  →  Names CONTAINING 'a'
-- ============================================
-- Find employees whose name has 'a' anywhere
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%a%';

-- Examples that match: Maria, Adam, Nathan, Sarah

-- ============================================
-- Example 4: Vowels at the START (a%, e%, i%, o%, u%)
-- ============================================
-- Find employees whose first name starts with a vowel
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'a%'
   OR first_name LIKE 'e%'
   OR first_name LIKE 'i%'
   OR first_name LIKE 'o%'
   OR first_name LIKE 'u%';

-- Examples that match: Alice, Emily, Ivan, Oliver, Uma

-- ============================================
-- Example 5: Vowels at the END (%a, %e, %i, %o, %u)
-- ============================================
-- Find employees whose first name ends with a vowel
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%a'
   OR first_name LIKE '%e'
   OR first_name LIKE '%i'
   OR first_name LIKE '%o'
   OR first_name LIKE '%u';

-- Examples that match: Maria, Sophie, Ravi, Bruno, Nanu

-- ============================================
-- Example 6: _ (Underscore - exactly ONE character)
-- ============================================
-- Find names that are exactly 4 characters long
SELECT first_name
FROM employees
WHERE first_name LIKE '____';   -- four underscores = 4 characters

-- Find names where 2nd character is 'a'
SELECT first_name
FROM employees
WHERE first_name LIKE '_a%';

-- Examples that match: Jack, Mary, David (2nd char = a)

-- ============================================
-- Example 7: Combining _ and %
-- ============================================
-- Find names starting with any character, then 'a', then anything
SELECT first_name
FROM employees
WHERE first_name LIKE '_a%';

-- Find 5-letter names starting with 'J'
SELECT first_name
FROM employees
WHERE first_name LIKE 'J____';  -- J + exactly 4 more characters

-- Examples that match: James, Jacob

-- ============================================
-- Example 8: NOT LIKE
-- ============================================
-- Find employees whose name does NOT start with a vowel
SELECT first_name, last_name
FROM employees
WHERE first_name NOT LIKE 'a%'
  AND first_name NOT LIKE 'e%'
  AND first_name NOT LIKE 'i%'
  AND first_name NOT LIKE 'o%'
  AND first_name NOT LIKE 'u%';

-- ============================================
-- LIKE vs REGEXP (Quick Comparison)
-- ============================================
-- LIKE '%a'         → ends with 'a'         (simple, faster)
-- REGEXP 'a$'       → ends with 'a'         (more flexible)

-- LIKE 'a%'         → starts with 'a'       (simple, faster)
-- REGEXP '^a'       → starts with 'a'       (more flexible)

-- LIKE is preferred for simple patterns (better performance)
-- REGEXP is preferred for complex patterns (email, phone validation)

-- Key Points:
-- 1. % matches zero or more characters
-- 2. _ matches exactly one character
-- 3. LIKE is case-insensitive by default in MySQL
-- 4. Use LIKE BINARY for case-sensitive matching
-- 5. NOT LIKE excludes matching rows
