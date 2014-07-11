Rails.application.routes.draw do

  root to: 'users#index'

  get 'movie_recommendations/:user_id/search'  =>  'movie_recommendations#search', :as => :search_movies
  get 'movie_recommendations/:user_id/results'  =>  'movie_recommendations#results', :as => :movies_results
  get 'movie_recommendations/:id/message'      =>  'movie_recommendations#message', :as => :movie_rec_message
  get 'movie_recommendations/:id/complete'     =>  'movie_recommendations#complete', :as => :movie_rec_complete

  get 'book_recommendations/:user_id/search'  =>  'book_recommendations#search', :as => :search_books
  get 'book_recommendations/:user_id/results'  => 'book_recommendations#results', :as => :books_results
  get 'book_recommendations/:id/message'      =>  'book_recommendations#message', :as => :book_rec_message
  get 'book_recommendations/:id/complete'     =>  'book_recommendations#complete', :as => :book_rec_complete

  get 'users/:id/movie_recommendations'  =>  'users#movie_recommendations', :as => :user_movie_recs
  get 'users/:id/completed_movie_recommendations'  =>  'users#movie_recommendations', :as => :completed_user_movie_recs
  get 'users/:id/book_recommendations'  =>  'users#book_recommendations', :as => :user_book_recs
  get 'users/:id/completed_book_recommendations'  =>  'users#book_recommendations', :as => :completed_user_book_recs

  resources :users
  resources :movie_recommendations
  resources :book_recommendations

  #Sessions
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout'    => 'sessions#destroy'

end
