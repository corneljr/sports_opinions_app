class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :opinion_id
      t.boolean :polarity
      t.integer :comment_id

      t.timestamps
    end
  end
end
