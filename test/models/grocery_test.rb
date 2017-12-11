require 'test_helper'

class GroceryTest < ActiveSupport::TestCase

  def setup
    @groceries = Grocery.new(item: "Milk", quantity: 2)
  end

  test "should be valid" do
    assert @groceries.valid?
  end

  test "item should be present" do
    @groceries.item = "     "
    assert_not @groceries.valid?
  end
end
