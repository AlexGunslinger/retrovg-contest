class User < ActiveRecord::Base
  has_many :submissions
  scope :scoreboard, ->(game_id) { joins(:submissions).select("users.id, users.name, MAX(score) as max_score").where("submissions.game_id = ?", game_id).order("max_score DESC").group("users.id, users.name")}
end