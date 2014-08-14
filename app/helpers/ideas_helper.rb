module IdeasHelper
  def button_move(direction)
    content_tag :button, '', type: "submit", name: "direction", value: direction, class: "glyphicon glyphicon-arrow-#{direction}"
  end
end
