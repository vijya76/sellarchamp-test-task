# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:sku).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to have_many(:variant_options) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:variant)).to be_valid
  end

  it 'is valid with a sku, price, quantity and product_id' do
    expect(create(:variant)).to be_valid
  end

  it 'is invalid without sku' do
    variant = FactoryBot.build(:variant)
    variant.sku = nil
    expect(variant.valid?).to eq(false)
    expect(variant.errors[:sku]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid if sku not unique' do
    product = FactoryBot.build(:product)
    FactoryBot.create(:variant)
    variant2 = Variant.create(price: 12.0, product: product, sku: 'DEF')
    expect(variant2.valid?).to eq(false)
    expect(variant2.errors[:sku]).to include(I18n.t('test.errors.taken'))
  end
end
