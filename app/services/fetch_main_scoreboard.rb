class FetchMainScoreboard

  def self.call()
    users = User.order('name DESC')
    players = Array.new

    users.each do |u|
      players << {id: u.id, name: u.name, points: 0}
    end

    Game.all.each do |g|
      user_game_scoreboard = User.scoreboard(g.id)
      user_game_scoreboard.each_with_index do |ugs, i|
        points = (g.name == "Contra" && ugs.max_score > 1000000) ? players.size : players.size - i
        players.find{|p| p[:id] == ugs.id}[:points] += points
      end
    end

    players.sort_by {|p| [-p[:points], p[:name].capitalize]}
  end

end