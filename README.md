# SQL Tasks

**Point 1:**
```sql
SELECT 
  od.*, 
  (
    SELECT customer_id 
    FROM orders as o 
    WHERE o.id = od.order_id
  ) as customer_id
FROM order_details as od;
```
![Image for the task 5.1](/task-5-p-1.webp)

**Point 2:**
```sql
SELECT *
FROM order_details as od
WHERE order_id IN (SELECT o.id FROM orders as o where o.shipper_id = 3);
```
![Image for the task 5.2](/task-5-p-2.webp)

**Point 3:**
```sql
SELECT 
  temp_table.order_id, 
  AVG(temp_table.quantity) AS average_quantity
FROM (SELECT * FROM order_details WHERE order_details.quantity < 10) AS temp_table
GROUP BY temp_table.order_id;
```
![Image for the task 5.3](/task-5-p-3.webp)

**Point 4:**
```sql
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
```
![Image for the task 5.4](/task-5-p-4.webp)

**Point 5:**
```sql
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
```
![Image for the task 5.5](/task-5-p-5.webp)
