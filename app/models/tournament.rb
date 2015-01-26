class Tournament < ActiveRecord::Base
  has_many :games
  has_many :users
  has_many :teams
end
