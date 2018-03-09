require 'test_helper'

class GroceryTest < ActiveSupport::TestCase

  def setup
    @user = users(:dash)
    @groceries = @user.groceries.build(item: "Powerade", quantity: 2)
  end

  test "should be valid" do
    assert @groceries.valid?
  end

  test "item should be present" do
    @groceries.item = "     "
    assert_not @groceries.valid?
  end

  test "item should not be too long" do
    @groceries.item = "a" * 51
    assert_not @groceries.valid?
  end

  test "quantity should be whole number" do
    @groceries.quantity = 24.44
    assert_not @groceries.valid?
  end
end
