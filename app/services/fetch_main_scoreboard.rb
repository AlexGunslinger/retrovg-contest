class FetchMainScoreboard

  def self.call()
    users = User.order('name DESC')
    players = Array.new

    users.each do |u|
      players << {id: u.id, name: u.name, points: 0}
    end

    Game.all.each do |g|
      game_scoreboard = User.scoreboard(g.id)
      game_scoreboard.each_with_index do |gs, i|
        players.find{|p| p[:id] == gs.id}[:points] += players.size - i
      end
    end

    players.sort_by {|p| [-p[:points], p[:name]]}
  end

end