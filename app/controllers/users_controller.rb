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
      @user_id = params[:id]
      @user = User.find(@user_id)
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.email = params[:email]
      @user.bio = params[:bio]
      @user.school = params[:school]
      @user.faculty = params[:faculty]

      if @user.save
          flash[:success] = "Profile updated!"
      else
          flash[:error] = "Error"
      end
      redirect_to action: "show", user_id: @user_id
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
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :role)
  end

end
