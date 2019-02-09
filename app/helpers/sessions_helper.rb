module SessionsHelper
  def current_user
    @cuerrent_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
end
