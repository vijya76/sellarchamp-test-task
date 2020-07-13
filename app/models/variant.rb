class Variant < ApplicationRecord
  # associations
  belongs_to :product
  has_many :variant_options
  has_many :options, through: :variant_options

  # validations
  validates :sku, presence: true, uniqueness: true
end
