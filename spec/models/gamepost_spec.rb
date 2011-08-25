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

require 'spec_helper'

describe Gamepost do
  pending "add some examples to (or delete) #{__FILE__}"
end
