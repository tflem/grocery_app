require "application_system_test_case"

class GroceriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
  end

  test "viewing the index" do
    sign_in @user
    visit groceries_path
    assert_selector "h2", text: "Grocery List"
  end  
end
