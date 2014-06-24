class Comment < ActiveRecord::Base
	has_many :votes
	belongs_to :commentable, :polymorphic => true
	belongs_to :user
	validates :body, presence: true

end
