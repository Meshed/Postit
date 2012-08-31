class Comment < ActiveRecord::Base
  attr_accessible :comment, :post_id, :user_id

  belongs_to :post
  belongs_to :user
end
