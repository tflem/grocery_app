require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
  end

  test "unsuccessful registration edit" do
    sign_in @user
    get edit_user_registration_path(@user)
    assert_template "devise/registrations/edit"
    patch user_registration_path, params: { user: { email:                 "paws@ff.com",
                                                    password:              "password",
                                                    password_confirmation: "",
                                                    current_password:      "" } }
   assert_template "devise/registrations/edit"
  end

  test "successful registration edit with friendly forwarding" do
    get edit_user_registration_path(@user)
    sign_in @user
    assert_response 401
    email    = "dash@furrealfriends.com"
    password = "password"
    patch user_registration_path, params: { user: { email:                 email,
                                                    password:              password,
                                                    password_confirmation: "",
                                                    current_password:      "" } }
    assert_equal "Signed in successfully.", "Signed in successfully."
    assert_response :success
    @user.reload
    assert_equal email, @user.email
  end
end
