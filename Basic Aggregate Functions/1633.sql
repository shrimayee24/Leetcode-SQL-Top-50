#count occurences contest ids
#count total user ids
#divide each count of contest ids by total users to find ratio
#multiply ratio by 100 to get %

SELECT contest_id,ROUND((COUNT(contest_id)*100)/(SELECT COUNT(user_id) FROM Users ),2)AS percentage FROM Register
GROUP BY contest_id
ORDER BY percentage DESC,contest_id ASC
