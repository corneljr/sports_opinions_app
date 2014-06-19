class CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)

		if @comment.opinion_id
			redirect_to opinion_path(@comment.opinion_id)
		elsif @comment.article_id
			redirect_to article_path(@comment.article_id)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id,:opinion_id,:body, :article_id)
	end

end
