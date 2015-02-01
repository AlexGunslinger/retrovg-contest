class User < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :team
  has_many :submissions
  validates_presence_of :name, :team_id
  scope :scoreboard, -> (game_id) { joins(:submissions).select("users.id, users.name, MAX(score) as max_score, MAX(submissions.created_at) as creat_at").where("submissions.game_id = ?", game_id).order("max_score DESC, creat_at ASC").group("users.id, users.name")}
end