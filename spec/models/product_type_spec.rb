# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductType, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:products) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:product_type)).to be_valid
  end

  it 'is valid with a name' do
    expect(create(:product_type)).to be_valid
  end

  it 'is invalid without an name' do
    product_type = FactoryBot.build(:product_type, name: nil)
    product_type.valid?
    expect(product_type.errors[:name]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid with a duplicate name' do
    FactoryBot.create(:product_type, name: 'ABC')
    product_type = FactoryBot.build(:product_type, name: 'ABC')
    product_type.valid?
    expect(product_type.errors[:name]).to include(I18n.t('test.errors.taken'))
  end
end
