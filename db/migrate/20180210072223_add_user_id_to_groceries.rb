class AddUserIdToGroceries < ActiveRecord::Migration[5.1]
  def change
    add_reference :groceries, :user, foreign_key: true
  end
end
