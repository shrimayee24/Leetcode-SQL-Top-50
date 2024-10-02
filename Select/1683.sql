-- Problem #1683: Retrieve tweets where content length is greater than 15
SELECT tweet_id 
FROM tweets 
WHERE LENGTH(content) > 15;
