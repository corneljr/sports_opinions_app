class AddArticleIdAndOpinionIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :article_id, :integer
    add_column :comments, :opinion_id, :integer
  end
end
