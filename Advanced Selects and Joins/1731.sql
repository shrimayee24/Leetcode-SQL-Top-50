#use self join to map employee ids who is reported by another employee
# calculate avg of age in alias of the table which refers to reports_to attribute
SELECT E1.employee_id,E1.name,COUNT(E1.employee_id) AS reports_count,ROUND(AVG(E2.age)) AS average_age 
FROM Employees AS E1
JOIN Employees AS E2
ON E1.employee_id=E2.reports_to
GROUP BY E1.employee_id,E1.name
ORDER BY employee_id
