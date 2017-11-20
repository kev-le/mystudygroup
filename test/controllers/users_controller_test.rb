require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new user page (sign up)" do
    get new_session_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, params: { users: { email:@user.email, first_name: @user.first_name, last_name: @user.last_name, password: 'secret', password_confirmation: 'secret', role:@user.role }}
    end
    assert_redirected_to root_url_path(Users.last)
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

  test "should update user" do
    put user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, role:@user.role } }
    assert_redirected_to user_url(@user)
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

  # test "user has valid email and password (login successfully)" do
  #   assert Users.all.include?(@user)
  #   assert_redirected_to root_url_path
  # end

end
