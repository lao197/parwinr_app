# == Schema Information
#
# Table name: post_likes
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  gamepost_id :integer
#

class PostLike < ActiveRecord::Base

  belongs_to :user
  belongs_to :gamepost
  
  validates :user_id, :presence => true
  validates :gamepost_id, :presence => true  
end
