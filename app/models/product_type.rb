class ProductType < ApplicationRecord
  # associations
  has_many :products, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
end
