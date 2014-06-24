class AddPolymorphicAssociationsToComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :article_id
  	remove_column :comments, :opinion_id
  	add_column :comments, :commentable_id, :integer
  	add_column :comments, :commentable_type, :string
  end
end
