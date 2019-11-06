# README

## Api end points & docs 
### USER Authentication Call - [GET]
``http://165.22.75.82/v1/users/hassam/authentication``

### Movies List
#### All Movies  - [GET]
```http://165.22.75.82/v1/movies```
#### Favourite Movies  - [GET]
```http://165.22.75.82/v1/movies/favourite/users/hassam```
#### Make a movie favorite - [POST]
```http://165.22.75.82/v1/movies/2/users/hassam/favorite```

### Remove Movie from Favourite List - [DELETE]
```http://165.22.75.82/v1/movies/2/users/hassam/favorite```

### Get Movie Details - [GET]
```http://165.22.75.82/v1/movies/3```
