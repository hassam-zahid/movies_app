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
  get 'authenticate_user' => 'api#authenticate_user'
  get 'movies_list' => 'api#movies_list'
  get 'movie_bucket' => 'api#movie_bucket'
  get 'movie_details' => 'api#movie_details'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
