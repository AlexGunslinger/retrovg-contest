class User < ActiveRecord::Base
  has_many :submissions

  scope :tournament_one, -> { where(tournament_id: nil) }

  scope :scoreboard, -> (game_id) { joins(:submissions).select("users.id, users.name, MAX(score) as max_score, MAX(submissions.created_at) as creat_at").where("submissions.game_id = ? AND users.tournament_id IS NULL", game_id).order("max_score DESC, creat_at ASC").group("users.id, users.name")}
end
