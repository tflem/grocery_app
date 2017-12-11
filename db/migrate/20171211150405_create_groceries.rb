class CreateGroceries < ActiveRecord::Migration[5.1]
  def change
    create_table :groceries do |t|
      t.string :item
      t.integer :quantity

      t.timestamps
    end
  end
end
