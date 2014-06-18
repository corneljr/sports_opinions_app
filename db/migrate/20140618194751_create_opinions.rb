class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
