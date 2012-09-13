class Comment < ActiveRecord::Base
	authenticates_with_sorcery!

  attr_accessible :comment, :post_id, :user_id

  belongs_to :post
  belongs_to :user
end
