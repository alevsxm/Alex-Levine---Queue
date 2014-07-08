class RemoveBookAndMovieRecIDs < ActiveRecord::Migration
  def up
    add_column :book_recommendations, :recommendee_id, :integer
    add_column :book_recommendations, :recommendor_id, :integer
    add_column :movie_recommendations, :recommendee_id, :integer
    add_column :movie_recommendations, :recommendor_id, :integer
  end

  def down
    remove_column :users, :book_recommendation_id
    remove_column :users, :movie_recommendation_id
  end
end
