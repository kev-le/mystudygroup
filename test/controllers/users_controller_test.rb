require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new user page (sign up)" do
    get new_session_path
    assert_response :success
  end

  test "should get new login page" do
    get login_path
    assert_response :success
  end

  test "should get home page" do
    get root_url_path
    assert_response :success
  end

  test "user has valid email and password" do
    assert Users.all.include?(@user)
    assert_redirected_to root_url_path
  end

end
