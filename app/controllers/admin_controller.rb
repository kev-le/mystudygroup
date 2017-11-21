class AdminController < ApplicationController

  # GET /admin
  # GET /admin.json
  def index
    @users = User.all
  end

  # GET /admin/1
  # GET /admin/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /admin/new
  def new
    @user = User.new
  end

  # GET /admin/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /admin
  # POST /admin.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/1
  # PATCH/PUT /admin/1.json
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

  # DELETE /admin/1
  # DELETE /admin/1.json
  def destroy
    @user = User.find(params[:id])

    # DELETE ALL ENROLLMENTS ASSOCIATED AS WELL
    Enrollment.where("user_id" => @user.id).destroy_all

    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/admin', notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :first_name, :last_name, :email)
    end
end
