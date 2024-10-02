select EU.unique_id,E.name from Employees E
left join EmployeeUNI EU on EU.id=E.id
