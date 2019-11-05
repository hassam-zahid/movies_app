class ApiController < ApplicationController
  def authenticate_user
    render json: User.authenticate_user(params[:user_name])
  end

  def movies_list
    render json: Movie.movies_list(params[:category], params[:user_name])
  end

  def movie_bucket
    render json: Movie.movie_operations_for_favorite_bucket(params[:movie_id], params[:user_name], params[:make_favorite])
  end

  def movie_details
    render json: Movie.movie_details(params[:movie_id], params[:user_name])
  end
end
