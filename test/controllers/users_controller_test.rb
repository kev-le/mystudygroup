require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end


  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
     get new_user_url
     assert_response :success
   end

   test "should show user" do
     get user_url(@user)
     assert_response :success
   end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end


  test "should get new user page (sign up)" do
    get new_session_path
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end

  test "should get new login page" do
    get login_path
    assert_response :success
  end

  test "should get home page" do
    get root_url_path
    assert_response :success
  end


  test "should create user" do
    @user = User.new
    @user.first_name = "bobby"
    @user.last_name = "chan"
    @user.email = "bobby@sfu.ca"
    assert_difference('User.count') do
      post "/admin/users", params: { user: { first_name: @user.first_name, last_name: @user.last_name, email:"d@d.com", "password" => "123456", "password_confirmation" => "123456" } }
    end

    assert_redirected_to "/"
  end

end
