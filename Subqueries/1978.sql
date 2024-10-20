#first select employees whose salary<30000
SELECT employee_id
FROM Employees
WHERE salary < 30000
#filter by manager_id not null i.e they have a manager.
AND manager_id IS NOT NULL
#and manager_id doesnt match with employee_ids.
AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
