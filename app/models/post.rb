class Post < ActiveRecord::Base
  attr_accessible :description, :url, :user_id

  belongs_to :user
end
