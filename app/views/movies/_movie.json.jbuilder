json.extract! movie, :id, :name, :genre_id, :year, :director, :main_star, :description, :favorited_by_users, :created_at, :updated_at
json.url movie_url(movie, format: :json)
