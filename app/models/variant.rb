class Variant < ApplicationRecord
  # associations
  belongs_to :product
  has_many :variant_options

  # validations
  validates :sku, presence: true, uniqueness: true
  validate :uniqueness_of_options_on_variant, on: :create

  accepts_nested_attributes_for :variant_options, reject_if: :all_blank, allow_destroy: true

  def uniqueness_of_options_on_variant
    option_types = variant_options.map(&:option_type)
    unless option_types.count == option_types.uniq.count
      errors.add(:base, I18n.t('variant.create.duplicate_option'))
    end
  end
end
