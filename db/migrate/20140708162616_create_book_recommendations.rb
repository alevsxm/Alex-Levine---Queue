class CreateBookRecommendations < ActiveRecord::Migration
  def change
    create_table :book_recommendations do |t|
      t.string :title
      t.string :author
      t.integer :year_published
      t.text :plot_summary
      t.text :img_url
      t.text :message
      t.text :rating
      t.boolean :finished
      t.integer :user_rating
      t.references :user

      t.timestamps
    end
  end
end
