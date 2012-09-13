class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password, :password_confirmation, :username

  has_many :posts
  has_many :comments
end
