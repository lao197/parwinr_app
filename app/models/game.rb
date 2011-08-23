# == Schema Information
#
# Table name: games
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  rating      :decimal(3, 2)   default(0.0)
#  totalRating :integer         default(0)
#  noOfRating  :integer         default(0)
#  likes       :integer         default(0)
#  user_id     :integer
#  video_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Game < ActiveRecord::Base
  attr_accessor :rating, :totalRating, :noOfRating
  attr_accessible :title, :description
  
  belongs_to :user
  belongs_to :video
  
  validates :title,
  		:presence => true,
  		:length => { :maximum => 255 }
  validates_numericality_of :noOfRating, :greater_than_or_equal_to => 0
  		
  before_save :calculate_rating
  
  private
  
    def calculate_rating()
      if noOfRating > 0
        rating = totalRating / noOfRating
      end
    end
  
end
