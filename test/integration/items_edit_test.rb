require "test_helper"

class ItemsEditTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @item = groceries(:first_item)
  end

  test "unsuccessful item edit" do
    sign_in users(:dash)
    get edit_grocery_path(@item)
    assert_template "groceries/edit"
    patch grocery_path(@item), params: { grocery: { item:     "",
                                                    quantity: 2 } }
    assert_template "groceries/edit"
    assert_select "div.alert", text: "The form contains 1 error."
  end

  test "successful item edit" do
    sign_in users(:dash)
    get edit_grocery_path(@item)
    assert_template "groceries/edit"
    item     = "Milk"
    quantity = 2
    patch grocery_path(@item), params: { grocery: { item:     item,
                                                    quantity: quantity } }
    assert_not flash.empty?
    assert_redirected_to @item
    @item.reload
    assert_equal item,     @item.item
    assert_equal quantity, @item.quantity
  end
end
