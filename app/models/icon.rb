class Icon < ApplicationRecord
  has_many :categories

  validates :name, :icon, presence: true
end
