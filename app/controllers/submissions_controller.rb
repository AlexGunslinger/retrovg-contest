class SubmissionsController < ApplicationController

  before_filter :fetch_players_and_games, only: [:new, :create]

  def new
    @submission = Submission.new(user_id: cookies[:player_id])
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.ip_address = request.remote_ip
    if @submission.save
      set_player_cookie
      redirect_to scoreboard_game_path(@submission.game), notice: "Good Luck!"
    else
      render "new"
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :game_id, :score)
  end

  def fetch_players_and_games
    @players = User.tournament_one.order('name ASC')
    @games   = Game.tournament_one.order('name ASC')
  end

  def set_player_cookie
    if cookies[:player_id] != @submission.user_id
      cookies[:player_id] = @submission.user_id
    end
  end

end
