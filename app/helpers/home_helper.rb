module HomeHelper

  def player_submission(submission)
    "#{submission.user.name} <span class='small'>playing</span> #{link_to(submission.game.name, scoreboard_game_path(submission.game))}".html_safe
  end

end
