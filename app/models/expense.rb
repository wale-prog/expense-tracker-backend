class Expense < ApplicationRecord

  validates :amount, :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
