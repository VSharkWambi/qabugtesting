require 'bcrypt'

class User < ApplicationRecord

  attr_accessor :skip_pass_validation

  has_secure_password
  validates_presence_of :password, :on => :create, :unless => :skip_pass_validation

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by_uuid(auth_hash["uid"])
    if user.nil?
      user = User.create!({login: auth_hash['info']['email'], uuid: auth_hash['uid']})
    end
    user
  end
end
