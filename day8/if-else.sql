USE hexawrae;

DELIMITER //

CREATE PROCEDURE ShowStudent11(IN in_roll INT)
BEGIN

    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE v_subject VARCHAR(50);

    SELECT name, fee, subject
    INTO v_name, v_fee, v_subject
    FROM Student
    WHERE roll = in_roll;

    IF v_subject = 'Java' THEN

        UPDATE Student
        SET fee = fee + 100
        WHERE roll = in_roll;

    ELSE

        UPDATE Student
        SET fee = fee + 200
        WHERE roll = in_roll;

    END IF;

    SELECT name AS Name,
           fee AS Fee,
           subject AS Subject
    FROM Student
    WHERE roll = in_roll;

END //

DELIMITER ;

CALL ShowStudent11(102);

SELECT * FROM Student;