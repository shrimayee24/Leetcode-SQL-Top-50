#select count distinct users for a day as a user can have more than one sessions in a day.
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
#now select only the dates having a period of 30 days ending at 27th july 2019.
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
#count the users w.r.t date, group by date
GROUP BY activity_date;
