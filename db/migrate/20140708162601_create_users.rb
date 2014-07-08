class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :img_url
      t.references :book_recommendation
      t.references :movie_recommendation
    end
  end
end
