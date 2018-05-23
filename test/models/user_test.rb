require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "save new user" do
    user = User.new
    user.fullname = "Mister"
    user.email = "mister@gmail.com"
    user.password = "12345"
    user.password_confirmation = "12345"
    assert user.save, "user new"
  end

  test "failed save new user without password confirmation" do
    user = User.new
    user.fullname = "Mister"
    user.email = "mister@gmail.com"
    user.password = "12345"
    user.password_confirmation = ""
    assert_not user.save, "user failed without password confirmation"
  end

  test "try authenticate user" do
    user = User.find(1).authenticate("12345")
    assert_not_nil user, "user succesfully authenticate"
  end

  test "failed authenticate user" do
    user = User.find(1).authenticate("123456")
    assert_not user, "user failed authenticate"
  end

  test "try authenticate user by email" do
    user = User.find_by(email: "waksunari@gmail.com").authenticate("123456")
    assert_not_nil user, "user succesfully authenticate by email"
  end

  test "total of user with role member" do
    user = User.where("role = ?", 0)
    assert_equal 2, user.count, "member should be 2"
  end

  test "total of user with role admin" do
    user = User.where("role = ?", 1)
    assert_equal 1, user.count, "member should be 1"
  end
end
