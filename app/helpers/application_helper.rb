module ApplicationHelper
  def random_quote()
    key = ['a','b','c'][rand(0..2)]
    t("quotes.#{key}")
  end
  
  def active_link_to(title, path, param={})
    if param.has_key?(:class)
      param[:class] += (current_page?(path) ? ' active' : '')
    else
      param[:class] = (current_page?(path) ? 'active' : '')
    end
    link_to title, path, param
  end
end
