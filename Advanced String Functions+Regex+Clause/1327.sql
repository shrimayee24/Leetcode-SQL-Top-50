#create a table first of product ids and their total units of february 2020 which are >=100
WITH Orders1 AS
(
    SELECT product_id,
    SUM(unit) AS total FROM Orders 
    WHERE MONTH(order_date)=2 AND YEAR(order_date)=2020
    GROUP BY product_id
    HAVING total>=100

)
#join created table and product table by mapping product_ids
SELECT P.product_name,O.total AS unit FROM Products P
JOIN Orders1 O
ON P.product_id=O.product_id
