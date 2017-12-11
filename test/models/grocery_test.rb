require 'test_helper'

class GroceryTest < ActiveSupport::TestCase

  def setup
    @item = Grocery.new(item: "Milk", quantity: 2)
  end

  test "should be valid" do
    assert @item.valid?
  end
end
