class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  validates_presence_of :user_id, :game_id
  validates :score, numericality: { only_integer: true, message: "Should be a number!" } 

  LATEST = 7
end
