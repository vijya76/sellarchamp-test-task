class ProductType < ApplicationRecord
  # associations
  has_many :products, dependent: :destroy
  has_many :product_options, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
end
