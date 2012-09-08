class ChangeVotupDefaultForPost < ActiveRecord::Migration
  def up
  	change_column_default(:posts, :upvotes, 0)
  	change_column_default(:posts, :downvotes, 0)
  	change_column_default(:posts, :votescore, 0)
  end

  def down
  	change_column_default(:posts, :upvotes, nil)
  	change_column_default(:posts, :downvotes, nil)
  	change_column_default(:posts, :votescore, nil)
  end
end
