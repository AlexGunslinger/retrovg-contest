module ApplicationHelper

  def main_title
    request.user_agent =~ /Mobile|webOS/ ? "Yolympics" : "Yolympics"
  end

end
