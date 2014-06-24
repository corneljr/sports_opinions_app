class VotesController < ApplicationController
  def create
  	@voteable = load_parent
  	@vote = @voteable.votes.build(vote_params)
  	@vote.user_id = current_user.id
  	@vote.save
  	redirect_to @vote.parent
  end

  private

  def vote_params
  	params.require(:vote).permit(:quality)
  end
end
