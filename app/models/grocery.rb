class Grocery < ApplicationRecord
  belongs_to :user
  validates :item, presence: true, length: { maximum: 50 }, uniqueness: {
    case_sensitive: false, message: " has already been added" }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
