class User < ActiveRecord::Base
  has_many :submissions
  scope :scoreboard, ->(game_id) { joins(:submissions).select("users.id, users.name, MAX(score) as max_score, MAX(submissions.created_at) as creat_at").where("submissions.game_id = ?", game_id).order("max_score DESC, creat_at DESC").group("users.id, users.name")}
end