# == Schema Information
#
# Table name: gameposts
#
#  id         :integer         not null, primary key
#  text       :text
#  likes      :integer         default(0)
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Gamepost < ActiveRecord::Base
  attr_accessor :likes
  attr_accessible :text

  belongs_to :user
  belongs_to :game
  
  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :game_id, :presence => true
  
  has_many :post_likes, :dependent => :destroy
  
  default_scope :order => 'gameposts.created_at DESC'
end
