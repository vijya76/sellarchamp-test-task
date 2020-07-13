class ProductOption < ApplicationRecord
  # associations
  belongs_to :product_type

  # validations
  validates :supported_option_type, presence: true
end
