class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password, 
									:password_confirmation, :username,
									:twitter

  has_many :posts
  has_many :comments
  has_many :votes
end
