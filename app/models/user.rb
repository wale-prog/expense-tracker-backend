class User < ApplicationRecord
  has_secure_password

  has_many :expenses, dependent: :destroy
  has_many :categories, dependent: :destroy


  validates :email, :name, presence: true, uniqueness: true
end
