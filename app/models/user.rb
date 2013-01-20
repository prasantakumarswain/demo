class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  #has_many :posts
  acts_as_authentic

  validates :name, :presence => true
end
