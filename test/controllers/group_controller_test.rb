require 'test_helper'

class GroupControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @user = users(:one)

    # Log a user in to create a session before testing
    post "/sessions", params: { email: @user.email, password: "password"}
  end

  test "should create group" do
    assert_difference("Group.count") do
      post "/addagroup/create", params: { group: { course_id: @course.id, name: "Test Group", description: "test description" } }
    end

    assert_redirected_to("/groups")
  end
end
