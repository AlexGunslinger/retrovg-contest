class HomeController < ApplicationController
  def index
    @players = User.all
  end
end
