class CommentsController < ApplicationController

	def create
		@commentable = load_parent
		@comment = @commentable.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to @comment.parent
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_type, :commentable_id)
	end

end
