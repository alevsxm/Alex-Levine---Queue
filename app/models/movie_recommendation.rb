class MovieRecommendation < ActiveRecord::Base
  belongs_to :recommendor, :class_name => "User"
  belongs_to :recommendee, :class_name => "User"

  validates :title, :recommendee_id, presence: true
end
