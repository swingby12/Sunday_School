module ApplicationHelper
  def icon_html(icon, white = false)
      if white
        return raw("<i class=\"icon-#{icon} icon-white\"></i> ")
      else
        return raw("<i class=\"icon-#{icon}\"></i> ")
      end
  end
end
