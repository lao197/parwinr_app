# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  firstName         :string(255)
#  lastName          :string(255)
#  email             :string(255)
#  username          :string(255)
#  encryptedPassword :string(255)
#  salt              :string(255)
#  accountType       :string(255)
#  points            :integer
#  level             :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
