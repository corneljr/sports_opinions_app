class Opinion < ActiveRecord::Base
	belongs_to :user
	has_many :votes
	has_many :comments

	def upvote_count
		counter = 0
		self.votes.each do |vote|
			counter += 1 if vote.polarity.to_s == 'true'
		end
		counter
	end

	def downvote_count
		counter = 0
		self.votes.each do |vote|
			counter -= 1 if vote.polarity.to_s == 'false'
		end
		counter
	end
end
