class Vote < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :vote
  
  belongs_to :post
  belongs_to :user
end
