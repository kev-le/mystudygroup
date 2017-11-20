class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # POST /enrollments/add
  def add
    params[:course_id].each do |id|
      # Find if they are enrolled in that course already
      found = Enrollment.find_by("course_id" => id, "user_id" => session[:user_id])

      # if not found then save the new enrollment
      if (!found)
        @enrollment = Enrollment.new("course_id" => id, "user_id" => session[:user_id])
        @enrollment.save
      end
    end
    redirect_to '/courses'
  end

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # /enrollments/remove/:id
  def remove
    @enrollment = Enrollment.find_by("id" => params[:id])
    course_id = @enrollment.course_id
    # remove the course enrollment
    @enrollment.destroy

    # also remove any associated groups
    @enrollments = Enrollment.where("user_id" => session[:user_id], "course_id" => course_id)
    @enrollments.each do |enrollment|
      if !enrollment.group_id.blank?
        # remove the group enrollments
        enrollment.destroy
      end
    end
    redirect_to '/courses'
  end

  # /enrollments/group/remove/:id
  def group_remove
    @enrollment = Enrollment.find_by("group_id" => params[:id], "user_id" => session[:user_id])
    if @enrollment.destroy
      redirect_to '/groups'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_id, :percentage, :lettergrade)
    end
end
