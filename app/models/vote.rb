class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :opinion
	belongs_to :article
	belongs_to :comment
end
