class CommentsController < ApplicationController

	def create
		@comment = Comment.create(params[])

	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_type, :commentable_id)
	end

end
