require "test_helper"

class AddingItemsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
  end

  test "invalid form input" do
    sign_in @user
    get new_grocery_path
    assert_no_difference "Grocery.count" do
      post groceries_path, params: { grocery: { item: "",
                                                quantity: 2 } }
    end
    assert_template "groceries/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid form input" do
    sign_in @user
    get new_grocery_path
    assert_difference "Grocery.count", 1 do
      post groceries_path, params: { grocery: { item: "milk",
                                                quantity: 2 } }
    end
    follow_redirect!
    assert_template "groceries/show"
    assert_not flash.empty?
  end
end
