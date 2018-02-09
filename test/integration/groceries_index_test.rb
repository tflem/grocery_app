require "test_helper"

class GroceriesIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:dash)
  end

  test "index including pagination" do
    sign_in @user
    get groceries_path
    assert_template "groceries/index"
    assert_select "div.pagination", count: 2
    Grocery.paginate(page: 1).each do |grocery|
      assert_select "td.grocery-items", text: grocery.item
    end
  end
end
