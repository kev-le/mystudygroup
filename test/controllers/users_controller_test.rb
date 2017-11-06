require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new user page (sign up)" do
    get new_session_path
    assert_response :success
  end

end
