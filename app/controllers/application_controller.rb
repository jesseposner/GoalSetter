class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def log_out
    current_user.try(:reset_token!)
    session[:session_token] = nil
  end

  def log_in(user)
    @current_user = user
    @current_user.reset_token!
    session[:session_token] = @current_user.session_token
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
end
