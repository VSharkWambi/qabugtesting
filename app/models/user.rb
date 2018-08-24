require 'bcrypt'

class User < ApplicationRecord

  attr_accessor :skip_pass_validation

  has_secure_password validations: false
  validates_presence_of :password, :on => :create, :unless => :skip_pass_validation

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.where(uuid: auth_hash["uid"]).first
    if user.nil?
      user = User.new({login: auth_hash['info']['email'], uuid: auth_hash['uid']})
      user.skip_pass_validation = true
      user.save
    end
    user
  end
end
