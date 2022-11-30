class Category < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :exp_cats
  has_many :expenses, through: :exp_cats, dependent: :destroy

  validates :name, :user_id, presence: true

  def sum_amount
    expenses.sum(:amount)
  end
end
