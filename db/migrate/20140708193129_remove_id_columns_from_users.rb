class RemoveIdColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :book_recommendation_id
    remove_column :users, :movie_recommendation_id
    remove_column :book_recommendations, :user_id
    remove_column :movie_recommendations, :user_id
  end
end
