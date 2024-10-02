-- 2.Basic Joins

-- Problem #1378: Left join Employees with EmployeeUNI on their id


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

--Problem #1661: Average Time of Process per Machine
SELECT s.machine_id,round(avg(e.timestamp-s.timestamp),3) AS processing_time
FROM Activity s JOIN Activity e ON
    s.machine_id = e.machine_id AND s.process_id = e.process_id AND
    s.activity_type = 'start' AND e.activity_type = 'end'
    GROUP BY s.machine_id

--Problem #577: Employee Bonus
# Write your MySQL query statement below
SELECT e.name,b.bonus 
FROM Employee e
LEFT JOIN Bonus b ON e.empId=b.empId 
WHERE b.bonus<1000 OR b.bonus IS NULL

