class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      # Automatically sign in user
      session[:user_id] = @user.id

      redirect_to root_url_path, notice: 'Successfully signed up!'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :role)
  end

end
