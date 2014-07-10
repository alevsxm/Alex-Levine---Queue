class AddMediaTypeToMovies < ActiveRecord::Migration
  def change
    change_column :book_recommendations, :finished, :boolean, :default => false
    change_column :movie_recommendations, :finished, :boolean, :default => false
  end
end
