#combine all requester ids and accepter ids into one column: all_ids using union operation
#give same alias 'id' for requester id and accepter id
WITH all_ids AS 
(
   SELECT requester_id AS id 
   FROM RequestAccepted
   UNION ALL
   SELECT accepter_id AS id
   FROM RequestAccepted
)
#total friends for an id=count of that id as requester + count of that id as accepter
#thus count occurence of each id in all_ids table as it contains requester and accepter ids together
SELECT id, 
   COUNT(id) AS num
FROM all_ids
GROUP BY id
#order in descending manner
ORDER BY COUNT(id) DESC
#return id with highest count of friends
LIMIT 1
