class Game < ActiveRecord::Base
  belongs_to :tournament
  has_many :submissions
  scope :scoreboard, -> (user_id) { joins(:submissions).select("games.id, games.name, MAX(score) as max_score, MAX(submissions.created_at) as creat_at").where("submissions.user_id = ?", user_id).order("games.name ASC").group("games.id, games.name")}
end
