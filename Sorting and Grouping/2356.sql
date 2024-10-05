  #count distinct subject ids for teachers (even if they teach one subject in 2 different depts, its hould be treated as one)
SELECT teacher_id,COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
  #make the grouping using teacher id
GROUP BY teacher_id
