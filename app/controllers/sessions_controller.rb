class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:email] = user.email
      session[:first_name] = user.first_name
      session[:last_name] = user.last_name
      session[:role] = user.role

      redirect_to root_url_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url_path, notice: 'Logged out!'
  end


end
