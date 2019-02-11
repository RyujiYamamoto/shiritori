module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def log_in(user)
    callback = session[:callback]
    reset_session
    session[:user_id] = user.id
    session[:callback] = callback
    cookies.permanent.signed[:user_id] = user.id
  end
  
  def let_log_in_unless_logged_in(path)
    unless logged_in?
      session[:callback] = path
      return redirect_to login_path
    end
  end
  
  def log_out
    reset_session
    @current_user = nil
  end
  
  def logged_in?
    current_user.present?
  end
end
