class GroupController < ApplicationController
  def enroll
    @courses = Course.all
  end

  def courses
    # get the user enrollments
    enrollments = Enrollment.where("user_id" => session[:user_id])

    @enrollments = []
    # get the user courses
    enrollments.each do |enrollment|
      # check if the enrollment is for a group
      if (!enrollment.group_id.blank?)
        next
      end
      @enrollments.push(enrollment)
    end

    if (@enrollments.empty?)
      @empty = "No available courses."
    end
  end

  def groups
    # get the user enrollments
    enrollments = Enrollment.where("user_id" => session[:user_id])
    @groups = []

    # get the user groups
    enrollments.each do |enrollment|
      if (enrollment.group_id.blank?)
        next
      end
      group = Group.find_by("id" => enrollment.group_id)
      @groups.push(group)
    end

    if (@groups.empty?)
      @empty = "No available groups."
    end
  end

  def findagroup
    @course = Course.find_by("id" => params[:id])
    if (!@course)
      @empty = "Course was not found"
    else
      @groups = Group.where('course_id' => @course.id)
      if(@groups.empty?)
        @empty = "No available groups."
      end
    end
  end

  def addagroup
    # get the user enrollments
    enrollments = Enrollment.where("user_id" => session[:user_id])

    @courses = []
    enrollments.each do |enrollment|
      if (!enrollment.group_id.blank?)
        next
      end
      course = enrollment.course
      @courses.push(course)
    end
    if (@courses.empty?)
      @empty = "You are not enrolled in any courses"
    else
      @group = Group.new
    end
  end

  def create
    @group = Group.new(group_params)
    if (@group.save)
      # add user to group
      @enrollment = Enrollment.create("user_id" => session[:user_id], "course_id" => @group.course_id, "group_id" => @group.id)
    end
    redirect_to '/groups'
  end

  # /join_group/:course_id/:id
  def join
    # check if user has already joined
    found = Enrollment.find_by("user_id" => session[:user_id], "course_id" => params[:course_id], "group_id" => params[:id])
    if !found
      @enrollment = Enrollment.create("user_id" => session[:user_id], "course_id" => params[:course_id], "group_id" => params[:id])
    end
    redirect_to '/groups'
  end

  def group_page
    @group = Group.find_by("id" => params[:id])

    @members = []
    @enrollments = Enrollment.where("group_id" => @group.id)
    @enrollments.each do |enrollment|
      user = User.find_by("id" => enrollment.user_id)
      @members.push(user)
    end
  end

  def change_location
    @group = Group.find_by("id" => params[:id])
  end

  # POST /groups/update_location
  def update_location
    puts group_params
    @group = Group.find_by("id" => group_params[:id])
    @group.latitude = group_params[:latitude].to_f
    @group.longitude = group_params[:longitude].to_f
    @group.location_description = group_params[:location_description]
    @group.save
    redirect_to "/group_page/" + @group.id.to_s
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:id, :course_id, :name, :location_description, :latitude, :longitude, :address)
    end
end
