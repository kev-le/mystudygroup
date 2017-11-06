require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save with null fields" do
    @user = User.new
    assert !@user.save
  end

  test "should save user with valid fields" do
    @user = User.new
    @user.first_name = "bobby"
    @user.last_name = "chan"
    @user.email = "bobby@sfu.ca"
    @user.password_digest = "123456"
    assert @user.save
  end

  test "should not save user with name length < 2" do
    @user = User.new
    @user.first_name = "b"
    @user.last_name = "chan"
    @user.email = "bobby@sfu.ca"
    @user.password_digest = "123456"
    assert !@user.save
  end

  test "should not save user with email that's already taken" do
    @user2 = User.new
    @user2.first_name = "bobby"
    @user2.last_name = "chan"
    @user2.email = "already@taken.ca"
    @user2.password_digest = "123456"
    @user2.save
    assert !@user2.save
  end

end
