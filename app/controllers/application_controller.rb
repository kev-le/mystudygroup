class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def is_logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    @current_user ||= User.find(session[:user_id]) if session[:role] == "admin"
  end

  helper_method :is_logged_in?
  helper_method :is_admin?
end
