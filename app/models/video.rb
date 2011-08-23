# == Schema Information
#
# Table name: videos
#
#  id         :integer         not null, primary key
#  videoID    :string(255)
#  videoType  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Video < ActiveRecord::Base
  attr_accessible :videoID, :videoType
end