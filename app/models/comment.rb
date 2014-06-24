class Comment < ActiveRecord::Base
	has_many :votes
	belongs_to :commentable, :polymorphic => true
end
