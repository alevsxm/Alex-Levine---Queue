Rails.application.routes.draw do

  root to: 'users#index'

  get 'movie_recommendations/:user_id/search'  =>  'movie_recommendations#search', :as => :search_movies
  get 'movie_recommendations/:user_id/results'  =>  'movie_recommendations#results', :as => :movies_results

  get 'book_recommendations/:user_id/search'  =>  'book_recommendations#search', :as => :search_books
  get 'book_recommendations/:user_id/results'  => 'book_recommendations#results', :as => :books_results

  resources :users
  resources :movie_recommendations
  resources :book_recommendations

  #Sessions
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout'    => 'sessions#destroy'

end
