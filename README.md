# README

## Api end points & docs 
### USER Authentication Call
``http://localhost:3000/authenticate_user?user_name=hassam``

### Movies List
#### All Movies
```http://localhost:3000/movies_list?user_name=hassam&category=all```
#### Favourite Movies
```http://localhost:3000/movies_list?user_name=hassam&category=favorite```
#### Make a movie favorite
```http://localhost:3000/movie_bucket?user_name=hassam&category=all&movie_id=1&make_favorite=1```

### Remove Movie from Favourite List
```http://localhost:3000/movie_bucket?user_name=hassam&category=all&movie_id=1&make_favorite=0```

### Get Movie Details
```http://localhost:3000/movie_details?user_name=hassam&movie_id=3```