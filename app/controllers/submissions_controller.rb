class SubmissionsController < ApplicationController
  def new
  	@submission = Submission.new
  end

  def create
  	@submission = Submission.create!(submission_params)
  	redirect_to :root, notice: "Good Luck!"
  end

  private

  def submission_params
  	params.require(:submission).permit(:user_id, :game_id, :score)
  end
  
end
