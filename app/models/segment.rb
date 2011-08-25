# == Schema Information
#
# Table name: segments
#
#  id        :integer         not null, primary key
#  startTime :integer
#  endTime   :integer
#  game_id   :integer
#

class Segment < ActiveRecord::Base
  attr_accessor :startTime, :endTime
  
  belongs_to :game
  
  validates :startTime, :presence => true
  validates :game_id, :presence => true
  
  has_many :segment_tasks, :dependent => :destroy
  has_many :tasks, :through => :segment_tasks
end
