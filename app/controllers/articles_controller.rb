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
	end

	def update
		Article.update(article_params)
		redirect_to article_path(@article.id)
	end

	private

	def article_params
		params.require(:article).permit(:title,:body,:user_id)
	end

end


