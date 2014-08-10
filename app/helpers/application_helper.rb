module ApplicationHelper
  def random_quote()
    key = ['a','b','c'][rand(0..2)]
    t("quotes.#{key}")
  end
  
  def flag(locale=I18n.locale)
    content_tag :span, '', :class => "flag flag-#{locale}"
  end
end
