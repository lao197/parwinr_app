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

require 'spec_helper'

describe Task do
  pending "add some examples to (or delete) #{__FILE__}"
end
