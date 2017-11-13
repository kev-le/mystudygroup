class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /admin/courses
  # GET /admin/courses.json
  def index
    @courses = Course.all
  end

  # GET /admin/courses/1
  # GET /admin/courses/1.json
  def show
    @course = Course.find(params[:id])
    @enrollments = Enrollment.where("course_id" => params[:id])
  end

  # GET /admin/courses/details/1
  def details
    @course = Course.find(params[:id])
  end

  # GET /admin/courses/new
  def new
    @course = Course.new
  end

  # GET /admin/courses/1/edit
  def edit
  end

  # POST /admin/courses
  # POST /admin/courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to action: "details", id: @course.id, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/courses/1
  # PATCH/PUT /admin/courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to action: "details", id: @course.id, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/courses/1
  # DELETE /admin/courses/1.json
  def destroy

    # DELETE ALL ENROLLMENTS AS WELL
    Enrollment.where("course_id" => @course.id).destroy_all

    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_id, :name, :description)
    end
end
