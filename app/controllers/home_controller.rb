class HomeController < ApplicationController
  def index
  end

  def scoreboard
    @players    = FetchMainScoreboard.call
    @latest_sub = Submission.tournament_one.order("created_at DESC").limit(Submission::LATEST)
  end

  def player_scoreboard
    @player     = User.find(params.fetch(:id))
    @games      = Game.scoreboard(@player.id)
    @latest_sub = @player.submissions.order("submissions.created_at DESC").limit(Submission::LATEST)
  end
end
