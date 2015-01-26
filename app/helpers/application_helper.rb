module ApplicationHelper

  def main_title
    request.user_agent =~ /Mobile|webOS/ ? "Mame Olympics" : "Mame Olympics"
  end

end
