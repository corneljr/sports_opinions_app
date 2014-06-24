class OpinionsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	 skip_before_action :verify_authenticity_token, :only => [:vote]


	def index
		@opinions = Opinion.all
	end

	def new
		@opinion = Opinion.new
	end

	def create
		@opinion = Opinion.create(opinion_params)
		if @opinion.save
			redirect_to opinion_path(@opinion.id)
		else
			render :new
		end
	end

	def show
		@opinion = Opinion.find(params[:id])
		@comments = @opinion.comments
		@comment = Comment.new
		@vote_average = vote_average(@opinion).round
		@voted = current_user_has_voted?(@opinion) 
	end

	def vote
		@vote = Vote.create(user_id: current_user.id, quality: params[:quality], opinion_id: params[:id])
		redirect_to opinion_path(params[:id])
	end

	private

	def opinion_params
		params.require(:opinion).permit(:title,:body,:user_id)
	end

end
