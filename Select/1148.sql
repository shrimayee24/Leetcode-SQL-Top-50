-- Problem #1148: Find authors who have viewed their own articles
SELECT DISTINCT author_id AS 'id' 
FROM Views 
WHERE author_id = viewer_id 
ORDER BY author_id;
