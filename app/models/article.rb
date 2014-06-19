class Article < ActiveRecord::Base
	belongs_to :user
	has_many :votes
	has_many :comments
	validate :title, presence: true, length: {
		minimum: 4, maximmum: 64
	}
end
