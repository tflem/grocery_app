require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user       = users(:dash)
    @other_user = users(:paws)
  end

  test "should get new" do
    get new_user_session_path
    assert_response :success
  end

  test "should redirect edit when logged in as wrong user" do
    sign_in @other_user
    get edit_user_registration_path(@user)
    assert flash.empty?
    assert_response :success
  end

  test "should redirect update when logged in as wrong user" do
    sign_in @other_user
    patch user_registration_path, params: { user: { email:                 @user.email,
                                                    password:              @user.password,
                                                    password_confirmation: @user.password,
                                                    current_password:      @user.password } }
    assert flash.empty?
    assert_response :success
  end

  test "should get 401 when not logged in, attempting edit" do
    get edit_user_registration_path(@user)
    assert_equal "You need to sign in or sign up before continuing.",
      "You need to sign in or sign up before continuing."
    assert_response 401
  end

  test "should get 401 when not logged in, attempting update" do
    patch user_registration_path(@user), params: { user: { email:        @user.email,
                                                           password:     @user.password } }
    assert_equal "You need to sign in or sign up before continuing.",
      "You need to sign in or sign up before continuing."
    assert_response 401
  end

  test "should get 200 when logged in as other user,
    attempting edit of another user" do
    sign_in @other_user
    get edit_user_registration_path(@user)
    assert_equal "You need to sign in or sign up before continuing.",
      "You need to sign in or sign up before continuing."
    assert_response :success
  end
end
