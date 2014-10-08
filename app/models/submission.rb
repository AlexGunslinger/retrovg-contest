class Submission < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	validates_presence_of :user_id, :game_id, :score

end
