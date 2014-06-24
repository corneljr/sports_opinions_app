class AddPolymorphicAssocaitionsToVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :article_id
  	remove_column :votes, :opinion_id
  	remove_column :votes, :comment_id
  	add_column :votes, :voteable_type, :string
  	add_column :votes, :voteable_id, :integer
  end
end
