class Game < ActiveRecord::Base
  has_many :submissions
  scope :tournament_one, -> { where(tournament_id: nil) }
  scope :scoreboard, -> (user_id) { joins(:submissions).select("games.id, games.name, MAX(score) as max_score, MAX(submissions.created_at) as creat_at").where("submissions.user_id = ? AND games.tournament_id IS NULL", user_id).order("games.name ASC").group("games.id, games.name")}
end
