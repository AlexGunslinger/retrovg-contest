class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def scoreboard
    @game = Game.find(params.fetch(:id))
    @players = User.scoreboard(@game.id)
  end
end
