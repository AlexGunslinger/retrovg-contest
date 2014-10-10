require 'rails_helper'

describe "submit a new score" do
  before(:all) do
    User.delete_all
    Game.delete_all
  end
	
  set(:player) { create(:user) }
  set(:game) { create(:game) }
	
  it "saves submission correctly" do
    visit '/submit'
    select player.name, from: 'submission_user_id'
    select game.name, from: 'submission_game_id'
    fill_in 'submission_score', with: "99999"
    expect {
      click_button 'Submit'
    }.to change { Submission.count }.by 1

    expect(page.body).to include "Good Luck!"

    submission = Submission.last

    expect(submission.user).to eq player
    expect(submission.game).to eq game
    expect(submission.score).to eq 99999
	end

  it "throw error if score is not integer" do
    visit '/submit'
    select player.name, from: 'submission_user_id'
    select game.name, from: 'submission_game_id'
    fill_in 'submission_score', with: "99999a"
    expect {
      click_button 'Submit'
    }.to_not change(Submission, :count) 

    expect(page.body).to include "Should be a number!"
  end

end
	