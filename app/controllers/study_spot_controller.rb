class StudySpotController < ApplicationController
  def index
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
      @empty = "No available study spots. Did you enroll in any courses?"
    end
  end
end
