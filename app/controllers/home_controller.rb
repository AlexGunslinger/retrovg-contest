class HomeController < ApplicationController
  def index
    @players    = FetchMainScoreboard.call
    @latest_sub = Submission.order("created_at DESC").limit(Submission::LATEST)
  end
end
