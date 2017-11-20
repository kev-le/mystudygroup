require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "can create new user" do
    get new_user_url
    assert_response :success

    @user = User.new
    @user.first_name = "bobby"
    @user.last_name = "chan"
    @user.email = "bobby@sfu.ca"
    assert_difference('User.count') do
      post "/users", params: { user: { first_name: @user.first_name, last_name: @user.last_name, email:"successfully" } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end
