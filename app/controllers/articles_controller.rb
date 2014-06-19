class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		redirect_to article_path(@article.id)
	end

	def show
		@article = Article.find(params[:id])
		@comments = @article.comments
		@comment = Comment.new
	end

	def update
		Article.update(article_params)
		redirect_to article_path(@article.id)
	end

	def vote
		if params[:polarity] == true || params[:polarity] = false
			Vote.create(user_id: current_user.id, polarity: params[:polarity], article_id: params[:id])
		end
		redirect_to article_path(params[:id])
	end



	private

	def article_params
		params.require(:article).permit(:title,:body,:user_id)
	end

end


