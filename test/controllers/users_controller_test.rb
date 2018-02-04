require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:dash)
  end

  test "should get new" do
    get new_user_session_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_registration_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect update when not logged in" do
    patch user_registration_path, params: { user: { email:    @user.email,
                                                    password: @user.password,
                                                    confirmation: @user.password_confirmation,
                                                    password: @user.current_password } }
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
end
