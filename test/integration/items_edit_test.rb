require "test_helper"

class ItemsEditTest < ActionDispatch::IntegrationTest

  def setup
    @item = groceries(:first_item)
  end

  test "unsuccessful item edit" do
    get edit_grocery_path(@item)
    assert_template "groceries/edit"
    patch grocery_path(@item), params: { grocery: { item:     "",
                                                    quantity: 2 } }
    assert_template "groceries/edit"
  end
end
