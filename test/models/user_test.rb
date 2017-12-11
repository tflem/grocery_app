require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "user@grocery.com", password: "123456")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
