-- Topic: MySQL Comments
-- Comments are used to explain sections of SQL statements, or to prevent execution of SQL statements.
-- MySQL supports three comment styles.

-- ============================================
-- 1. Single-Line Comments (Double Dash)
-- ============================================
-- The double-dash (--) is the standard SQL single-line comment.
-- IMPORTANT: In MySQL, the double-dash must be followed by at least one 
-- whitespace or control character (like a space, tab, newline, etc.).

-- This is a single-line comment
SELECT * FROM employees; -- This is also a comment

-- ============================================
-- 2. Single-Line Comments (Hash Sign)
-- ============================================
-- The hash (#) character is a MySQL-specific single-line comment style.
-- It does NOT require a trailing space like the double-dash.

# This is a MySQL-specific single-line comment
SELECT first_name FROM employees; # Another comment


-- ============================================
-- 3. Multi-Line Comments (C-Style)
-- ============================================
-- Use /* to start the comment and */ to end it.
-- This style can span multiple lines.

/*
This is a multi-line comment.
It can be used to document large blocks of code
or to temporarily disable multiple SQL statements.
*/

SELECT 
    /* first_name, */ -- You can even comment out parts of a line
    last_name,
    salary
FROM employees;


-- ============================================
-- 4. Executable Comments (MySQL Specific)
-- ============================================
-- MySQL allows you to write code that only executes on MySQL 
-- (and optionally only on specific versions). 
-- This is often used for portability.

/*! SELECT * FROM employees */; -- This executes normally in MySQL

/*!50110 SELECT * FROM employees */; -- Only executes if version is >= 5.1.10


-- ============================================
-- Summary
-- ============================================
-- Style | Syntax           | Note
-- ------|------------------|-----------------------------------------------
-- Dash  | -- comment       | Requires a space after the dashes
-- Hash  | # comment        | MySQL specific, no space required
-- Block | /* comment */    | Standard C-style, supports multiple lines
-- Exec  | /*! code */      | MySQL-specific "Hidden" code
