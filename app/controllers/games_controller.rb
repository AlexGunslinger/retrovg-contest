class GamesController < ApplicationController
  def index
    @tournament = Tournament.find(2)
    @games      = @tournament.games.order('name ASC')
  end

  def scoreboard
    @game       = Game.find(params.fetch(:id))
    @players    = User.scoreboard(@game.id)
    @teams      = Team.all
    @teamsf     = Array.new

    @teams.each do |t|
      @teamsf << {id: t.id, name: t.name, many: 0}
    end
    
    @latest_sub = @game.submissions.order("submissions.created_at DESC").limit(Submission::LATEST) 
  end
end
