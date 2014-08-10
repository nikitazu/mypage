module ApplicationHelper
  def random_quote()
    key = ['a','b','c'][rand(0..2)]
    t("quotes.#{key}")
  end
  
  def flag(locale=I18n.locale)
    content_tag :span, '', :class => "flag flag-#{locale}"
  end
  
  def active_link_to(title, path, param={})
    if is_link_active?(path)
      if param.has_key?(:class)
        param[:class] += ' active'
      else
        param[:class] = 'active'
      end
    end
    link_to title, path, param
  end
  
  private
    def is_link_active?(path)
      return current_page?(path) ||
        request.fullpath.starts_with?(path.to_s) ||
        path == :root && is_link_root?
    end
  
    def is_link_root?()
      request.fullpath == "/?locale=#{I18n.locale}" || request.fullpath == "/#{I18n.locale}"
    end
end
