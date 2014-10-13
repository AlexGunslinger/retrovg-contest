class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.ip_address = request.remote_ip
    if @submission.save
      redirect_to scoreboard_game_path(@submission.game), notice: "Good Luck!"
    else
      render "new"
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :game_id, :score)
  end
  
end
