-- Problem:
-- Use Stored Procedures to encapsulate logic and reusable code

-- ============================================
-- Example 1: Basic Stored Procedure
-- ============================================
-- Simple procedure to select all employees
DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;

-- Usage:
-- CALL GetAllEmployees();


-- ============================================
-- Example 2: Procedure with IN Parameter
-- ============================================
-- Get employees by department ID
DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT first_name, last_name, salary
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

-- Usage:
-- CALL GetEmployeesByDept(10);


-- ============================================
-- Example 3: Procedure with OUT Parameter
-- ============================================
-- Get the average salary of a specific department
DELIMITER //

CREATE PROCEDURE GetDeptStats(
    IN dept_id INT,
    OUT avg_salary DECIMAL(10,2),
    OUT employee_count INT
)
BEGIN
    SELECT AVG(salary), COUNT(*)
    INTO avg_salary, employee_count
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

-- Usage:
-- CALL GetDeptStats(10, @avg_sal, @cnt);
-- SELECT @avg_sal, @cnt;


-- ============================================
-- Example 4: Control Flow (IF/ELSE)
-- ============================================
-- Give a bonus based on sales performance
DELIMITER //

CREATE PROCEDURE CalculateBonus(
    IN employee_id INT,
    IN sales_amount DECIMAL(10,2)
)
BEGIN
    DECLARE bonus_amount DECIMAL(10,2);

    IF sales_amount > 50000 THEN
        SET bonus_amount = sales_amount * 0.10; -- 10% bonus
    ELSEIF sales_amount > 25000 THEN
        SET bonus_amount = sales_amount * 0.05; -- 5% bonus
    ELSE
        SET bonus_amount = 0;
    END IF;

    -- Update or Insert logic (mocked here)
    SELECT employee_id, sales_amount, bonus_amount AS calculated_bonus;
END //

DELIMITER ;


-- ============================================
-- Example 5: Transaction Handling
-- ============================================
-- Transfer funds between accounts safely
DELIMITER //

CREATE PROCEDURE TransferFunds(
    IN sender_id INT,
    IN receiver_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    -- Start a new transaction
    START TRANSACTION;

    -- Deduct from sender
    UPDATE accounts 
    SET balance = balance - amount 
    WHERE account_id = sender_id;

    -- Add to receiver
    UPDATE accounts 
    SET balance = balance + amount 
    WHERE account_id = receiver_id;

    -- Check for errors (e.g., insufficient funds resulting in negative balance)
    -- This is a simplified check; real-world apps use handlers
    IF (SELECT balance FROM accounts WHERE account_id = sender_id) < 0 THEN
        ROLLBACK;
        SELECT 'Transaction Failed: Insufficient Funds' AS message;
    ELSE
        COMMIT;
        SELECT 'Transaction Successful' AS message;
    END IF;
END //

DELIMITER ;

-- Expected Output:
-- Demonstrates creation and usage of stored procedures
-- Covers parameters, variables, control structures, and transactions
