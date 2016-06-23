class FetchPlayersScoreboard

  def self.call()
    tournament = Tournament.find(2)
    users      = tournament.users.order('name DESC')
    teams      = tournament.teams
    players    = Array.new
    teamsf     = Array.new

    users.each do |u|
      players << {id: u.id, name: u.name, team: u.team.name, points: 0}
    end

    teams.each do |t|
      teamsf << {id: t.id, name: t.name, many: 0}
    end

    tournament.games.each do |g|
      points = 20
      user_game_scoreboard = User.scoreboard(g.id)

      teamsf.each do |t|
        t[:many] = 0
      end

      user_game_scoreboard.each_with_index do |ugs, i|
        teamsf.find{|t| t[:id] == ugs.team_id}[:many] += 1
        if teamsf.find{|t| t[:id] == ugs.team_id}[:many] < 6
          players.find{|p| p[:id] == ugs.id}[:points] += points
          points -= 1
        end
      end
    end

    players.sort_by {|p| [-p[:points], p[:name].capitalize]}
  end

end