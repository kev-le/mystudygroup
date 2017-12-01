class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  before_action :cookie_set

  def cookie_set
    @user = User.find_by("id" => session[:user_id])
    return unless @user
    cookies[:user_id] = @user.id
  end

  def require_login
    unless is_logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login' # halts request cycle
    end
  end

  def is_logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    @current_user ||= User.find(session[:user_id]) if session[:role] == "admin"
  end

  helper_method :is_logged_in?
  helper_method :is_admin?
end
