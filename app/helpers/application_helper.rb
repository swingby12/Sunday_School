module ApplicationHelper
  def icon_html(icon)
    return raw("<i class=\"icon-#{icon}\"></i>")
  end
end
