class Post < ActiveRecord::Base
	authenticates_with_sorcery!

  attr_accessible :description, :url, :user_id, :voteup, :votedown, :votescore, :category
  validates :description, :presence => true
  validates :category, :presence => true

  belongs_to :user
  has_many :comments
  has_many :votes
end
