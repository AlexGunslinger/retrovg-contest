module GamesHelper

  def link_to_ru(game, text)
    link_to(content_tag(:div, text, class: "btn btn-primary pull-right link-ru"), game.link, target: "_blank") 
  end
end
