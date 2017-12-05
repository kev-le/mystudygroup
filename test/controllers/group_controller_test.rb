require 'test_helper'

class GroupControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:test_course_one)
    @user = users(:one)

    # Log a user in to create a session before testing
    post "/sessions", params: { email: @user.email, password: "password"}
  end

  test "should show groups index when logged in" do
    get "/groups"
    assert_response :success
  end

  test "should not show groups index when logged out" do
    get "/logout"
    get "/groups"
    assert_redirected_to "/login"
  end

  test "should create group" do
    assert_difference("Group.count") do
      post "/addagroup/create", params: { group: { course_id: @course.id, name: "Test Group", description: "test description" } }
    end

    assert_redirected_to("/groups")
  end

  test "should destroy group" do
    group = groups(:one)
    assert_difference('Group.count', -1) do
      delete "/group/" + group.id.to_s
    end

    assert_redirected_to "/groups"
  end
end
