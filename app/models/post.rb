class Post < ActiveRecord::Base
  attr_accessible :description, :url, :user_id, :voteup, :votedown, :votescore

  belongs_to :user
  has_many :comments
end
