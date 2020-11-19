module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to new_session_path unless signed_in?
  end

  def current_user
    return if session[:user_id].blank?

    @_current_user ||= User.find_by(id: session[:user_id])
  end
end
