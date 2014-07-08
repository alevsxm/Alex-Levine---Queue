class CreateMovieRecommendations < ActiveRecord::Migration
  def change
    create_table :movie_recommendations do |t|
      t.string :title
      t.string :director
      t.string :actors
      t.integer :year_released
      t.text :plot_summary
      t.text :img_url
      t.text :message
      t.string :rating
      t.string :media_type
      t.boolean :finished
      t.integer :user_rating
      t.references :user

      t.timestamps
    end
  end
end
