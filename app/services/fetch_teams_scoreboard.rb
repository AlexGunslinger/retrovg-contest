class FetchTeamsScoreboard

  def self.call(players)
    tournament = Tournament.find(2)
    teams      = Array.new
    
    tournament.teams.each do |t|
      teams << {id: t.id, name: t.name, points: 0}
    end

    players.each do |p|
      teams.find{|t| t[:name] == p[:team]}[:points] += p[:points]
    end

    teams.sort_by {|t| [-t[:points], t[:name].capitalize]}
  end

end