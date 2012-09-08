class AddVotingToPost < ActiveRecord::Migration
  def change
    add_column :posts, :upvotes, :int
    add_column :posts, :downvotes, :int
    add_column :posts, :votescore, :int
  end
end
