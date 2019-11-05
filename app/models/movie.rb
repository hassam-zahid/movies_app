class Movie < ApplicationRecord
  validates_length_of :name, minimum: 1, maximum: 80, allow_blank: false
  validates_length_of :year, minimum: 4, maximum: 4, allow_blank: false
  validates_length_of :director, maximum: 60, allow_blank: true
  validates_length_of :main_star, maximum: 60, allow_blank: true
  validates_length_of :description, maximum: 400, allow_blank: true

  has_and_belongs_to_many :genres

  has_attached_file :thumbnail, styles: { medium: "600x800>", thumb: "100x100>" }, default_url: "/images/movie_missing.jpg"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/

  def self.movies_list(category, user_name = nil)
    return Notification.notify(998, 'category is missing') unless category.present?
    return Notification.notify(999, 'user_name is missing') unless user_name.present?

    movies_data = []
    if category == 'all'
      movies_data = Movie.all.map{|movie|  movie.api_hash}
    elsif category == 'favorite'
      user_id = User.authenticate_user(user_name)[:data][:user_id]
      movies = User.find(user_id).favorite_movies
      movies_data = movies.map{|movie|  movie.api_hash}
    end
    Notification.notify(200, 'success', {movies: movies_data})
  end

  def self.movie_details(movie_id, user_name)
    return Notification.notify(999, 'user_name is missing') unless user_name.present?
    return Notification.notify(996, 'movie_id is missing') unless movie_id.present?

    movie = Movie.find_by_id(movie_id)
    return Notification.notify(994, 'invalid movie_id') if movie.nil?

    Notification.notify(200, 'success', {movie: movie.api_hash})
  end

  def api_hash
    movie = self
    {
        "id" => movie.id,
        "name" => movie.name,
        "year" => movie.year,
        "director" => movie.director,
        "main_star" => movie.main_star,
        "description" => movie.description,
        "favorited_by_users" => movie.favorited_by_users,
        genres: (self.genres.pluck(:name).uniq rescue []),
        "thumbnail" => BASE_URL + movie.thumbnail.url(:thumb)
    }
  end

  def self.movie_operations_for_favorite_bucket(movie_id, user_name, make_favorite)
    return Notification.notify(996, 'movie_id is missing') unless movie_id.present?
    return Notification.notify(999, 'user_name is missing') unless user_name.present?
    return Notification.notify(995, 'make_favorite is missing') unless make_favorite.present?

    movie = Movie.find_by_id(movie_id)
    return Notification.notify(994, 'invalid movie_id') if movie.nil?

    user_id = User.authenticate_user(user_name)[:data][:user_id]

    if make_favorite.to_i == 0
      FavoriteMovie.where(user_id: user_id, movie_id: movie_id).destroy_all rescue nil
    else
      FavoriteMovie.find_or_create_by(user_id: user_id, movie_id: movie_id)
    end
    movie.cache_favorited_by_users
    return Notification.notify
  end

  def cache_favorited_by_users
    favorite_count = FavoriteMovie.where(:movie_id => self.id).count rescue 0
    self.favorited_by_users = favorite_count
    self.save
  end
end
