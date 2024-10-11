#take one character at 1st position as a substring and convert it to uppercase
#take all characters starting from 2nd position as a substring and convert them to lowercase
#concatenate both the substrings

SELECT user_id, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;
