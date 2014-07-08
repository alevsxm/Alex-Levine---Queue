class User < ActiveRecord::Base
  has_secure_password

  has_many :given_book_recommendations, :class_name => "BookRecommendation",
  :foreign_key => "recommendee_id", dependent: :destroy
  has_many :given_movie_recommendations, :class_name => "BookRecommendation",
  :foreign_key => "recommendee_id", dependent: :destroy
  has_many :received_book_recommendations, :class_name => "MovieRecommendation",
  :foreign_key => "recommendor_id", dependent: :destroy
  has_many :received_movie_recommendations, :class_name => "MovieRecommendation",
  :foreign_key => "recommendor_id", dependent: :destroy

  validates :username, :first_name, :last_name, :email, :password_digest,
  presence: true
  validates :username, uniqueness: true
end
