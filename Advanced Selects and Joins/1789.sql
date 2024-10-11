#a dept of an employee is primary if:
#1. he belongs to multiple depts and value of primary dept is yes
#    OR
#2. he belongs to only one dept then that dept itself is primary dept.

#select records having primary flag as yes
#that means employee is in multiple depts and we are selecting those having yes value-which are primary depts
SELECT 
  employee_id, 
  department_id 
FROM 
  Employee 
WHERE 
  primary_flag = 'Y'

  UNION
  #as both cases are having or relation, we use union to combine values obtained from the 2 cases

#if employee_id count is one,that means it belongs to only one department and that dept is its primary department irrespective of yes no value
  SELECT 
  employee_id, 
  department_id 
FROM 
  Employee 
GROUP BY 
  employee_id 
HAVING 
  COUNT(employee_id) = 1

  
