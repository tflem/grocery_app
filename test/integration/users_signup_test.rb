require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference "User.count" do
      post user_registration_path, params: { user: { email:                 "",
                                                     password:              "foo",
                                                     password_confirmation: "bar" } }
    end
    assert_template "devise/registrations/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference "User.count", 1 do
      post user_registration_path, params: { user: { email:                 "patrick@ff.com",
                                                     password:              "password",
                                                     password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template "groceries/new"
    assert_not flash.empty?
  end
end
