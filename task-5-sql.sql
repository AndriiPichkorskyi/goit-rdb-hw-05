USE goit_dataset;

-- Point 1
SELECT 
	od.*, 
	(
		SELECT customer_id 
		FROM orders as o 
		WHERE o.id = od.order_id
    ) as customer_id
FROM order_details as od;

-- Point 2

SELECT *
FROM order_details as od
WHERE order_id IN (SELECT o.id FROM orders as o where o.shipper_id = 3);

-- Point 3

SELECT 
	temp_table.order_id, 
	AVG(temp_table.quantity) AS average_quantity
FROM (SELECT * FROM order_details WHERE order_details.quantity < 10) AS temp_table
GROUP BY temp_table.order_id;

-- Point 4

WITH temp_table AS (
	SELECT *
    FROM order_details
    WHERE order_details.quantity < 10
)
SELECT 
	temp_table.order_id, 
	AVG(temp_table.quantity) AS average_quantity
FROM temp_table
GROUP BY temp_table.order_id;

-- Point 5

DROP FUNCTION IF EXISTS Division;

DELIMITER //

CREATE FUNCTION Division(input_number_first FLOAT, input_number_second FLOAT)
RETURNS FLOAT
DETERMINISTIC 
NO SQL
BEGIN
	DECLARE result FLOAT DEFAULT 0;
    SET result = input_number_first / input_number_second;
    RETURN result;
END //

DELIMITER ;

SELECT Division(quantity, 0.75)
FROM order_details;



