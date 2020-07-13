class Product < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :product_type
  has_many :variants, dependent: :destroy

  # validations
  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true

  # validate unique sku for products and variants
  validate :uniqueness_of_sku_for_product_and_variants, on: :create

  accepts_nested_attributes_for :variants, reject_if: :all_blank, allow_destroy: true

  def uniqueness_of_sku_for_product_and_variants
    variants_skus = variants.map(&:sku)
    variants_skus = variants_skus.concat(sku.split)

    if Product.exists?(sku: variants_skus) || Variant.exists?(sku: variants_skus) ||
      !(variants_skus.count == variants_skus.uniq.count)
      errors.add(:base, I18n.t('product.create.sku_validation_error'))
    end
  end
end
