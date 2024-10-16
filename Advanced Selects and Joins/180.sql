#make 3 aliases of table-a set of 3 consecutive records iteratively
#check whether num values of all 3 consecutive records in the set are equal.
#use distinct to avoid duplicate answers from 2 iterations if there are more than 3 records having consecutive equal values.
#select num value of every 1st consecutive record
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
#l3-third consecutive record
#l2-second consecutive record
#l1-first consecutive record
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
#map consecutive 3 records having same number
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;
