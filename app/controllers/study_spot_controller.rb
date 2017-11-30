class StudySpotController < ApplicationController
  def index

    # get the courses of the user and put into array
    courses = Enrollment.where("user_id" => session[:user_id], "group_id" => nil).pluck(:course_id)

    # find all groups based on courses
    enrollments = []
    if (courses)
      courses.each do |id|
        enrollment = Enrollment.where("course_id" => id).where.not("group_id" => nil)
        if courses
          enrollments.push(*enrollment)
        end
      end
    end


    # get the groups for courses that user is enrolled in
    @groups = []
    enrollments.each do |enrollment|
      group = Group.find_by("id" => enrollment.group_id)
      @groups.push(group)
    end

    if (@groups.empty?)
      @empty = "No available study spots. Did you enroll in any courses?"
    else
      @group_ids = Enrollment.where("user_id" => session[:user_id]).pluck(:group_id)
    end
  end
end
