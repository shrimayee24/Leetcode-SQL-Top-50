#make a temp table to join names of departments ,names of employees,respective salaries 
#and also store ranking of salaries for each department using window partitions
WITH employee_department AS
(
    SELECT d.id, 
        d.name AS Department, 
        e.salary AS Salary, 
        e.name AS Employee,
        #create a window for each department based on id
        #sort salaries in descending order and rank them using dense rank function to have consecutive rankings even if duplicate values exist.
        #do ranking for all salaries in respective departments using window partition
        DENSE_RANK()OVER(PARTITION BY e.departmentId ORDER BY salary DESC) AS salary_rank
    FROM Department d
    JOIN Employee e
    ON d.id = e.departmentId
)
#select the records having top 3 ranking from each dept
#equal salaries are assigned same ranking
SELECT Department, Employee, Salary
FROM employee_department
WHERE salary_rank <= 3
