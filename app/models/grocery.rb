class Grocery < ApplicationRecord
  validates :item,     presence: true
  validates :quantity, presence: true
end
