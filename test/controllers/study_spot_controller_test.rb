require 'test_helper'

class StudySpotControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    # Log a user in to create a session before testing
    post "/sessions", params: { email: @user.email, password: "password"}
  end

  test "should assign study spot to group" do
    @group = groups(:one)
    post "/groups/update_location", params: { "group"=>{"id"=>@group.id.to_s, "latitude"=>"49.28111832554543", "longitude"=>"-122.91709363460541", "location_description"=>"" } }
    @group = Group.find(@group.id)
    assert_equal 49.2811183255454, @group.latitude
  end

  test "should change study spot of group" do
    @group = groups(:one)
    post "/groups/update_location", params: { "group"=>{"id"=>@group.id.to_s, "latitude"=>"49.28111832554543", "longitude"=>"-122.91709363460541", "location_description"=>"" } }
    post "/groups/update_location", params: { "group"=>{"id"=>@group.id.to_s, "latitude"=>"49.000000", "longitude"=>"-122.91709363460541", "location_description"=>"" } }
    @group = Group.find(@group.id)
    assert_equal 49.000000, @group.latitude
  end
end
