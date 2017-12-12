class Grocery < ApplicationRecord
  validates :item,     presence: true, length: { maximum: 50 }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
