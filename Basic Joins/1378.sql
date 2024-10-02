SELECT EU.unique_id, E.name 
FROM Employees E
LEFT JOIN EmployeeUNI EU 
  ON EU.id = E.id;
