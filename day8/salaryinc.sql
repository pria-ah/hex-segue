CREATE DATABASE CompanyDBs;
USE CompanyDBs;

-- Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT
);

-- Insert records
INSERT INTO Employee VALUES
(101, 'Amit', 25000, 1),
(102, 'Riya', 30000, 2),
(103, 'Rahul', 35000, 4),
(104, 'Priya', 40000, 3),
(105, 'Neha', 28000, 0);

-- Create procedure
DELIMITER //

CREATE PROCEDURE SalaryIncrement(IN p_id INT)
BEGIN
    DECLARE v_exp INT;

    SELECT experience INTO v_exp
    FROM Employee
    WHERE emp_id = p_id;

    IF v_exp <= 1 THEN

        UPDATE Employee
        SET salary = salary + (salary * 10 / 100)
        WHERE emp_id = p_id;

    ELSEIF v_exp <= 3 THEN

        UPDATE Employee
        SET salary = salary + (salary * 15 / 100)
        WHERE emp_id = p_id;

    ELSE

        UPDATE Employee
        SET salary = salary + (salary * 20 / 100)
        WHERE emp_id = p_id;

    END IF;

    SELECT * FROM Employee
    WHERE emp_id = p_id;

END //

DELIMITER ;

CALL SalaryIncrement(102);

SELECT * FROM Employee;