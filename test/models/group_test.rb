require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  setup do
    @course = courses(:test_course_one)
  end

  test "should save a group" do
    @group = Group.new(course_id: @course.id, name: "Test", description: "blah")
    assert @group.save
  end

end
