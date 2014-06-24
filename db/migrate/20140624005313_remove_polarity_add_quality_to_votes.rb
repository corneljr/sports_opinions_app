class RemovePolarityAddQualityToVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :polarity
  	add_column :votes, :quality, :float
  end
end
