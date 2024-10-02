-- Problem #1068: Join Sales and Product to retrieve product name, year, and price
SELECT EU.unique_id, E.name 
FROM Employees E
LEFT JOIN EmployeeUNI EU 
  ON EU.id = E.id;
