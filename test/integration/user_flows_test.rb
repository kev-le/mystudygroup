require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "can create new user" do
    get new_user_url
    assert_response :success
    post "/users", params: { user: { first_name: "can", last_name: "create", email:"successfully" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end
