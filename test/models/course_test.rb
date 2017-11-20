require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "shold not save with null fields" do
    @course = Course.new
    assert !@course.save
  end

  test "should not save with name length <4" do
    @course = Course.new
    @course.name = "CMP"
    assert !@course.save
  end

  test "should save with all valid field" do
    @course = Course.new
    @course.name = "CMPT 276"
    assert @course.save
  end
end
