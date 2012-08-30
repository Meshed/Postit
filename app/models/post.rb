class Post < ActiveRecord::Base
  attr_accessible :url, :user_id

  belongs_to :user
end
