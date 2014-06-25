require 'nokogiri'

module Opinions
	class SportsData

		def self.get_data
			doc = Nokogiri::XML(open("https://api.sportsdatallc.org/mlb-t4/daily/boxscore/2014/06/24.xml?api_key=bcm7cg36x8afwvj5v2ufnx6n"))
			data = []
			day = {}
			visitors = {}
			home = {}
			id = 1
			doc.css('boxscore/visitor').each do |visitor|
				visitors[id] = [visitor['name'], visitor['runs']]
				id += 1
			end
			id = 1
			doc.css('boxscore/home').each do |home|
				home[id] = [home['name'], visitor['runs']]
				id += 1
			end
			day[Time.now.getutc.to_s] = [visitors, home]
		end
	end
end

