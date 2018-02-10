require 'test_helper'

class GroceriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user       = users(:dash)
    @other_user = users(:paws)
    @item       = groceries(:first_item)
  end

  test "should get new" do
    sign_in @user
    get new_grocery_path
    assert_response :success
  end

  test "should redirect item edit when not logged in" do
    get edit_grocery_path(@item)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect item update when not logged in" do
    patch grocery_path(@item), params: { grocery: { item:     @item.item,
                                                    quantity: @item.quantity } }
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Grocery.count" do
      delete grocery_path(@item)
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect when attempting to destroy item created
    by another user" do
    sign_in @other_user
    assert_no_difference "Grocery.count" do
      delete grocery_path(@item)
    end
    follow_redirect!
    assert_not flash.empty?
  end
end
