class Opinion < ActiveRecord::Base
	belongs_to :user
	has_many :votes, :as => :voteable
	has_many :comments, :as => :commentable

	validates :title, :body, presence: true 
	validates :body, length: { in: 10..255 }
	validates :title, length: { in: 5..50 }
end
