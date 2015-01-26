pos = 1
json.players @players do |player|
  json.extract! player, :id, :name#, :points
  json.position pos
  json.team_name player.team.name
  json.url games_url(format: :json)
  pos += 1
end

json.contra_link submit_path

json.submissions @latest_sub do |submission|
  if submission.game.tournament_id == 2
    json.extract! submission, :score
    json.player_name submission.user.name
    json.game_name submission.game.name
    json.game_link scoreboard_game_path(submission.game)
  end
end