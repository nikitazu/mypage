module ActiveLinkHelper
  def active_link_to(title, path, param={})
    if is_link_active?(path)
      inject_link_params_with_active_class! param
    end
    link_to title, path, param
  end
  
  def active_rich_link_to(path, param={}, &block)
    if is_link_active?(path)
      inject_link_params_with_active_class! param
    end
    link_to path, param, &block
  end
  
  private
    def inject_link_params_with_active_class!(param)
      if param.has_key?(:class)
        param[:class] += ' active'
      else
        param[:class] = 'active'
      end
    end
  
    def is_link_active?(path)
      return current_page?(path) ||
        request.fullpath.starts_with?(path.to_s) ||
        path == :root && is_link_root?
    end
  
    def is_link_root?()
      request.fullpath == "/?locale=#{I18n.locale}" || request.fullpath == "/#{I18n.locale}"
    end
end
