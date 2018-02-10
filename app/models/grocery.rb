class Grocery < ApplicationRecord
  belongs_to :user
  validates :item,     presence: true, length: { maximum: 50 }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
