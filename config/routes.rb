Rails.application.routes.draw do
  get 'users' => 'user#index'
  get 'users/:user_name/show' => 'user#show', as: 'show_user'
  get 'destroy_user' => 'user#destroy'
  get 'admin' => 'movies#index'
  devise_for :users
  root 'website#index'
  get 'website/index'
  resources :movies


  # API ROUTES
  get 'v1/users/:user_name/authentication' => 'api#authenticate_user'
  post 'v1/users/:user_name/authentication' => 'api#authenticate_user'
  get 'v1/movies' => 'api#movies_list'
  get 'v1/movies/:movie_id' => 'api#movie_details'
  post 'v1/movies/:movie_id/users/:user_name/favorite' => 'api#add_favorite_movie'
  delete 'v1/movies/:movie_id/users/:user_name/favorite' => 'api#delete_favorite_movie'
  get 'v1/movies/favourite/users/:user_name' => 'api#favorite_movies_list'
end
