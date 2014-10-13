class HomeController < ApplicationController
  def index
    @players = FetchMainScoreboard.call
  end
end
