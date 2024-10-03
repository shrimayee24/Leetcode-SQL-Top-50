#use cross join to combine each row from table Student with each row from table Subject, resulting in every possible combination of student_id and subject_name from both tables.
SELECT 
    s.student_id, s.student_name, sub.subject_name, IFNULL(grouped.attended_exams, 0) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub

#creat the table grouped by a subquery, which count the number of exams each student attended for each subject.
#left join count of exams given to cross joined table
#if null function is used to replace null values with 0

  LEFT JOIN (
    SELECT student_id, subject_name, COUNT(*) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
) grouped 
ON s.student_id = grouped.student_id AND sub.subject_name = grouped.subject_name
ORDER BY s.student_id, sub.subject_name;
