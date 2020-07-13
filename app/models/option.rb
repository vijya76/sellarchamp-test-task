class Option < ApplicationRecord
  # validations
  validates :option_value, :option_type, presence: true

  scope :by_option_type, ->(type) { where(option_type: type) }
end
