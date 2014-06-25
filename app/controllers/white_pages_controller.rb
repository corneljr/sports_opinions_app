class WhitePagesController < ApplicationController

	def home
		@data = Opinions::SportsData.get_data
	end

end
