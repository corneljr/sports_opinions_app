class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :opinion
	belongs_to :voteable, :polymorphic => true
	belongs_to :article
	belongs_to :comment

	def parent
		voteable_type.constantize.find(voteable_id)
	end
end
