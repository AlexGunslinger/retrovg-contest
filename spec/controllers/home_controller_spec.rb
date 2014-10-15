require 'rails_helper'

RSpec.describe HomeController, :type => :controller do


  describe "GET index" do
    before(:all) do
      User.delete_all
      Submission.delete_all
      Game.delete_all
    end

    set(:player1)     { create(:user) }
    set(:player2)     { create(:user) }
    set(:game1)       { create(:game) }
    set(:submission1) { create(:submission, user: player1, game: game1, score: 10) }
    set(:submission2) { create(:submission, user: player2, game: game1, score: 20) }

    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "fetchs the proper scoreboard" do
    end

  end

end
