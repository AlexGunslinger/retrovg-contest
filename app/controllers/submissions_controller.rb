class SubmissionsController < ApplicationController

  before_filter :fetch_players_and_games, only: [:new, :create, :edit]

  def index
    @submissions = Submission.where("created_at > '2015-01-01'").order("created_at DESC")
  end

  def new
    @submission = Submission.new(user_id: cookies[:player_id])
  end

  def edit
    @submission = Submission.find(params[:id])
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

  def update
    @submission = Submission.find(params[:id])
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to submissions_path, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :game_id, :score)
  end
  
  def fetch_players_and_games
    @tournament = Tournament.find(2) 
    @players    = @tournament.users.order('name ASC')
    @games      = @tournament.games.order('name ASC')
  end

  def set_player_cookie
    if cookies[:player_id] != @submission.user_id
      cookies[:player_id] = @submission.user_id
    end
  end
  
end
