# == Schema Information
#
# Table name: segment_tasks
#
#  id         :integer         not null, primary key
#  segment_id :integer
#  task_id    :integer
#

class SegmentTask < ActiveRecord::Base
  attr_accessible :task_id
  
  belongs_to :segment
  belongs_to :task

  validates :segment_id, :presence => true
  validates :task_id, :presence => true
end
