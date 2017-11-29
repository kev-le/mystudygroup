class UsersController < ApplicationController

  # GET /admin/users
  # GET /admin.json
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    @user = User.find_by("id" => params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def changeProfile
    @user = User.find_by("id" => session[:user_id])
    respond_to do |format|
      if @user.update(allowed_params)
        flash.now.alert = 'Successfully updated'
        format.html { redirect_to update_user_path(session[:user_id]), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user = User.find(params[:id])

    # DELETE ALL ENROLLMENTS ASSOCIATED AS WELL
    Enrollment.where("user_id" => @user.id).destroy_all

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      # Automatically sign in user
      session[:user_id] = @user.id
      session[:email] = @user.email
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      session[:role] = @user.role
      redirect_to root_url_path, notice: 'Successfully signed up!'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:id, :user_id, :email, :first_name, :last_name, :bio, :school, :faculty, :password, :password_confirmation, :role)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:user_id, :first_name, :last_name, :email)
  end

end
