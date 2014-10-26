pos = 1
json.players @players do |player|
  json.extract! player, :id, :name, :points
  json.position pos
  json.url games_url(format: :json)
  pos += 1
end

json.contra_link scoreboard_game_path(Game.find_by_name("Contra"))

json.submissions @latest_sub do |submission|
  json.extract! submission, :score
  json.player_name submission.user.name
  json.game_name submission.game.name
  json.game_link scoreboard_game_path(submission.game)
end