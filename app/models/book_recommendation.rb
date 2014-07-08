class BookRecommendation < ActiveRecord::Base
  has_one :recommendor, :class_name => "User", :foreign_key => "recommendor_id"
  has_one :recommendee, :class_name => "User", :foreign_key => "recommendee_id"

  validates :title, :recommendee_id, :recommendor_id,
  presence: true
end
