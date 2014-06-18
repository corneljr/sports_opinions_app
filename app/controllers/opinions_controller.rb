class OpinionsController < ApplicationController
	def index
		@opinions = Opinion.all
	end

	def new
		@opinion = Opinion.new
	end

	def create
		@opinion = Opinion.create(opinion_params)
		redirect_to opinion_path(@opinion.id)
	end

	def show
		@opinion = Opinion.find(params[:id])
		@comments = @opinion.comments
		@comment = Comment.new
	end

	private

	def opinion_params
		params.require(:opinion).permit(:title,:body,:user_id)
	end

end
