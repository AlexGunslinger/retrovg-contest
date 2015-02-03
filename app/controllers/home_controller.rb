class HomeController < ApplicationController
  def index
  end

  def scoreboard
    @tournament = Tournament.find(2)
    #@players    = @tournament.users.order("name ASC")
    @players    = FetchPlayersScoreboard.call
    @teams      = FetchTeamsScoreboard.call(@players)
    @latest_sub = Submission.order("created_at DESC").limit(Submission::LATEST)
  end

  def player_scoreboard
    @player     = User.find(params.fetch(:id))
    @games      = Game.scoreboard(@player.id)
    @latest_sub = @player.submissions.order("submissions.created_at DESC").limit(Submission::LATEST)
  end
end
