class Post < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user
end
