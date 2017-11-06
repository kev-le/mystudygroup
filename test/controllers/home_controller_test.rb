require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get root_url_path
    assert_response :success
  end
end
