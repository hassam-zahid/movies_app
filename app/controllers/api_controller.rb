class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def authenticate_user
    render json: User.authenticate_user(params[:user_name])
  end

  def movies_list
    render json: Movie.movies_list('all', 'hassam')
  end

  def favorite_movies_list
    render json: Movie.movies_list('favorite', params[:user_name])
  end

  def add_favorite_movie
    render json: Movie.movie_operations_for_favorite_bucket(params[:movie_id], params[:user_name], '1')
  end

  def delete_favorite_movie
    render json: Movie.movie_operations_for_favorite_bucket(params[:movie_id], params[:user_name], '0')
  end

  def movie_details
    render json: Movie.movie_details(params[:movie_id], 'hassam')
  end
end
