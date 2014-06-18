class Comment < ActiveRecord::Base
	has_many :votes
	belongs_to :article
	belongs_to :opinion
	belongs_to :user
end
