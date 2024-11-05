#create record of name
#create record of movie
#join records using union

#create name record
(
    #map user ids in movie rating table to names in users table
    SELECT
        Users.name AS results
    FROM
        MovieRating LEFT JOIN Users
   ON
        MovieRating.user_id = Users.user_id 
    #group duplicate names
    GROUP BY
        Users.user_id
    #order using criteria- highest number of movie rating:count(movie id) and dictionary order (Users.name)
    ORDER BY
        COUNT(MovieRating.movie_id) DESC, 
        Users.name
    #select 1st record of sorted records
    LIMIT 1
) 
#join 2 records
UNION ALL

#create record for movie
(
    #map movie titles to movie ids
   SELECT
        Movies.title AS results
    FROM
        MovieRating  LEFT JOIN Movies 
    ON
        MovieRating.movie_id = Movies.movie_id
    #use like operator to select movies in February 2020
    WHERE
        MovieRating.created_at LIKE '2020-02%'
    #group duplicate titles
    GROUP BY
        MovieRating.movie_id
    #order using criteria- highest average of movie rating:count(movie id) and dictionary order (movies.title)
    ORDER BY
        avg(MovieRating.rating) DESC, 
        Movies.title
     #select 1st record of sorted records
   LIMIT 1
)
