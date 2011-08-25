# == Schema Information
#
# Table name: tasks
#
#  id         :integer         not null, primary key
#  taskType   :string(255)
#  xmlContent :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  attr_accessor :taskType, :xmlContent
  attr_accessible :taskType
  
  belongs_to :user
  
  validates :taskType, :presence => true
  validates :xmlContent, :presence => true
  validates :user_id, :presence => true
  
  has_many :segment_tasks, :dependent => :destroy
  has_many :segments, :through => :segment_tasks
end
