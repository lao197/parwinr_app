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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end
