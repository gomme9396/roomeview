class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def require_login
    if session[:user_id].nil?
      redirect_to "/user/login"
    end
  end
  
  def require_admin
    unless session[:user_id] == 'rlsvkf1012@naver.com'
      redirect_to "/"
    end
  end

end
