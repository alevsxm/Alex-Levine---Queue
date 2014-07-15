class User < ActiveRecord::Base
  has_secure_password

  # Books
  has_many :given_book_recommendations, :class_name => "BookRecommendation",
  :foreign_key => "recommendor_id", dependent: :destroy
  has_many :received_book_recommendations, :class_name => "BookRecommendation",
  :foreign_key => "recommendee_id", dependent: :destroy

  # Movies
  has_many :given_movie_recommendations, :class_name => "MovieRecommendation",
  :foreign_key => "recommendor_id", dependent: :destroy
  has_many :received_movie_recommendations, :class_name => "MovieRecommendation",
  :foreign_key => "recommendee_id", dependent: :destroy

  validates :username, :first_name, :last_name, :email, :password_digest,
  presence: true
  validates :username, uniqueness: true

  #Paperclip
  has_attached_file :avatar, :styles =>
  { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/assets/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  #Calculates the average rating of a users movie recommendations
  def avg_rating
    movie_recs = self.given_movie_recommendations
    book_recs = self.given_book_recommendations
    ratings = (movie_recs + book_recs).map(&:user_rating).compact

    return 0 if ratings.empty?

    (ratings.sum.to_f / ratings.size.to_f).round(1)
  end
end
