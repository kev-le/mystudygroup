class StudySpotController < ApplicationController
  def index

    # get the courses of the user and put into array
    @courses = Enrollment.where("user_id" => session[:user_id], "group_id" => nil).pluck(:course_id)

    # find all the groups for the courses
    @groups = []
    @courses.each do |id|
      group = Group.where("course_id" => id).where.not("latitude" => nil)
      
      @groups.push(*group)
    end

    if (@groups.empty?)
      @empty = "No available study spots. Did you enroll in any courses?"
    else
      @group_ids = Enrollment.where("user_id" => session[:user_id]).pluck(:group_id)
    end
  end
end
