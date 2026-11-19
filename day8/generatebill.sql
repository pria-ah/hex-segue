CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT
);
INSERT INTO item VALUES
(101, 'Keyboard', 500, 10),
(102, 'Mouse', 300, 5),
(103, 'Monitor', 8000, 3),
(104, 'Headphones', 1500, 8),
(105, 'USB Cable', 200, 20);
SELECT * FROM item;
DELIMITER //

CREATE PROCEDURE generatebill(IN p_item_id INT, IN p_qty INT)
BEGIN
    DECLARE v_item_name VARCHAR(50);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_quantity INT;
    DECLARE v_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO v_exists
    FROM item
    WHERE item_id = p_item_id;

    IF v_exists > 0 THEN

        SELECT item_name, price, quantity
        INTO v_item_name, v_price, v_quantity
        FROM item
        WHERE item_id = p_item_id;

        IF p_qty <= v_quantity AND p_qty > 0 THEN

            SELECT v_item_name AS item_name,
                   v_price AS price,
                   p_qty AS ordered_quantity,
                   v_price * p_qty AS total_bill;

            UPDATE item
            SET quantity = quantity - p_qty
            WHERE item_id = p_item_id;

        ELSE
            SELECT 'Insufficient stock or invalid quantity' AS message;
        END IF;

    ELSE
        SELECT 'Item not found' AS message;
    END IF;

END //

DELIMITER ;

CALL generatebill(101, 2);