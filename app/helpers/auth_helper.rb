module AuthHelper
  def current_user_is_admin?
    user_signed_in? and current_user.is_admin?
  end
end
