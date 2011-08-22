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

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :firstName, :lastName, :email, :username, :password, 
  		:password_confirmation, :points, :level
  
  validates :firstName, 
  		:presence => true, 
  		:length => { :maximum => 40 }
  validates :lastName, 
  		:presence => true, 
  		:length => { :maximum => 40 }
  validates :email, 
  		:presence => true, 
  		:uniqueness => { :case_sensitive => false }
  validates :username, 
  		:presence => true, 
  		:uniqueness => { :case_sensitive => false }
  validates :password, 
  		:presence => true, 
  		:confirmation => true, 
  		:length => { :within => 6..40 }

  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
  def has_password?(submittedPassword)
    encryptedPassword == encrypt(submittedPassword)
  end

  def self.authenticate(email, submittedPassword)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submittedPassword)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private 

    def encrypt_password()
      self.salt = make_salt() if new_record?
      self.encryptedPassword = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt()
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
