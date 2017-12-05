require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to login for restricted page" do
    get "/groups"
    assert_redirected_to "/login"
  end

  test "should get login page" do
    get login_path
    assert_response :success
  end

  test "should get home page" do
    get root_url_path
    assert_response :success
  end
end
