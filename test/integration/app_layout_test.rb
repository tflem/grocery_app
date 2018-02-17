require "test_helper"

class AppLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
  end

  test "layout links" do
    get new_user_session_path
    assert_template "devise/sessions/new"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_password_path
    sign_in @user
    get new_grocery_path
    assert_select "a[href=?]", groceries_path
    assert_select "a[href=?]", "#", text: "Account"
    assert_select "a[href=?]", edit_user_registration_path
    assert_select "a[href=?]", destroy_user_session_path
  end
end
