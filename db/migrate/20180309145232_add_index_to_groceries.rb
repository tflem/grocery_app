class AddIndexToGroceries < ActiveRecord::Migration[5.1]
  def change
    add_index :groceries, :item, unique: true
  end
end
