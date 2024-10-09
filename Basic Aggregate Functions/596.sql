#count number of students for each class
#select classes having students>=5
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(student)>=5
