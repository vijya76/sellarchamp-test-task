# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:sku).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product_type) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:product)).to be_valid
  end

  it 'is valid with a title, description, sku, product_type_id and user id' do
    expect(create(:product)).to be_valid
  end

  it 'is invalid without title' do
    product = FactoryBot.build(:product)
    product.title = nil
    expect(product.valid?).to eq(false)
    expect(product.errors[:title]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid without sku' do
    product = FactoryBot.create(:product)
    product.sku = nil
    expect(product.save).to eq(false)
    expect(product.errors[:sku]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid if sku not unique' do
    user = FactoryBot.build(:user)
    product_type = FactoryBot.build(:product_type)
    FactoryBot.create(:product)
    product2 = Product.create(title: 'Test Title', user: user, product_type: product_type, sku: 'ABC')
    expect(product2.valid?).to eq(false)
    expect(product2.errors[:sku]).to include(I18n.t('test.errors.taken'))
  end
end
