module GamesHelper

  def button_link(link, text, style='', target='')
    link_to(content_tag(:div, text, class: "btn #{style} pull-right link-ru"), link, target: "#{target}") 
  end
end
