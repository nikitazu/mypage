module ApplicationHelper
  def random_quote()
    key = ['a','b','c'][rand(0..2)]
    t("quotes.#{key}")
  end
end
