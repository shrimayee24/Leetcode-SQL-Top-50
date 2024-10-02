

-- 2.Basic Joins

-- Problem #1378: Left join Employees with EmployeeUNI on their id
SELECT EU.unique_id, E.name 
FROM Employees E
LEFT JOIN EmployeeUNI EU 
  ON EU.id = E.id;

-- Problem #1068: Join Sales and Product to retrieve product name, year, and price
SELECT P.product_name, S.year, S.price 
FROM Sales AS S
JOIN Product AS P 
  ON S.product_id = P.product_id;

-- Problem #1581: Count number of visits without a transaction per customer
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans 
FROM Visits v
LEFT JOIN Transactions t 
  ON t.visit_id = v.visit_id 
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Problem #197: Find weather records where temperature is higher than the previous day
SELECT w1.id 
FROM Weather w1
JOIN Weather w2 
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

