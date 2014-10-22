json.player_name @player.name
json.games @games do |game|
  json.extract! game, :id, :name, :max_score
  json.link scoreboard_game_path(game)
end

json.submissions @latest_sub do |submission|
  json.extract!  submission, :score
  json.game_name submission.game.name
  json.game_link scoreboard_game_path(submission.game)
end