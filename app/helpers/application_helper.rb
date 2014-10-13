module ApplicationHelper

  def main_title
    request.user_agent =~ /Mobile|webOS/ ? "Wolf IX" : "Wolf IX Video Armageddon 2"
  end

end
