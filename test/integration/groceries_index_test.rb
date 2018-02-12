require "test_helper"

class GroceriesIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
    @item = groceries(:first_item)
  end

  test "index including pagination with delete link" do
    sign_in @user
    get groceries_path
    assert_template "groceries/index"
    assert_select "ul.pagination", count: 2
    Grocery.paginate(page: 1).each do |grocery|
      assert_select "td.grocery-items", text: grocery.item
    end
    assert_difference "Grocery.count", -1 do
      delete grocery_path(@item)
    end
    assert_not flash.empty?
    assert_redirected_to groceries_path
  end
end
