require "test_helper"

class AddingItemsTest < ActionDispatch::IntegrationTest

  test "invalid form input" do
    get new_grocery_path
    assert_no_difference "Grocery.count" do
      post groceries_path, params: { grocery: { item: "",
                                                quantity: 2 } }
    end
    assert_template "groceries/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end
end
