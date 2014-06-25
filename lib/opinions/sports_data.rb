require 'nokogiri'

module Opinions
	class SportsData

		def self.get_data
			doc = Nokogiri::XML(open("https://api.sportsdatallc.org/soccer-t2/wc/matches/2014/6/24/schedule.xml?api_key=ubj3mvka769cbvqwmy7sevqb"))
			matches = doc.css("matches")
			data = []
			matches.each do |match|
				my_match = {}
				# do something and populate my hash
				my_match[:home] = match
				data << my_match
			end
			return data
		end

	end
end