#create record of name
#create record of movie
#join records using union

#create name record
(
    #map user ids in movie rating table to names in users table
    select
        Users.name as results
    from 
        MovieRating left join Users
    on 
        MovieRating.user_id = Users.user_id 
    #group duplicate names
    group by
        Users.user_id
    #order using criteria- highest number of movie rating:count(movie id) and dictionary order (Users.name)
    order by
        count(MovieRating.movie_id) desc, 
        Users.name
    #select 1st record of sorted records
    limit 1
) 
#join 2 records
union all

#create record for movie
(
    #map movie titles to movie ids
    select 
        Movies.title as results
    from 
        MovieRating  left join Movies 
    on
        MovieRating.movie_id = Movies.movie_id
    #use like operator to select movies in February 2020
    where 
        MovieRating.created_at like '2020-02%'
    #group duplicate titles
    group by
        MovieRating.movie_id
    #order using criteria- highest average of movie rating:count(movie id) and dictionary order (movies.title)
    order by
        avg(MovieRating.rating) desc, 
        Movies.title
     #select 1st record of sorted records
    limit 1
)
