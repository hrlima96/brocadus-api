require "securerandom"

class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def new_access_token
    token = generate_access_token
    self.update_attribute(:access_token, token)
    self.update_attribute(:access_token_generated_at, Time.now)
    token
  end

  def generate_access_token
    loop do
      token = SecureRandom.hex
      break token unless User.where(access_token: token).first 
    end
  end

  def reset_access_token
    self.update_attribute(:access_token, nil)
    self.update_attribute(:access_token_generated_at, nil)
  end
end
