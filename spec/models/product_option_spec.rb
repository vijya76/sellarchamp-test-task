# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductOption, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:supported_option_type).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:product_type) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:product_option)).to be_valid
  end

  it 'is valid with supported_option_type and product_type_id' do
    expect(create(:product_option)).to be_valid
  end

  it 'is invalid without supported_option_type' do
    product_option = FactoryBot.build(:product_option)
    product_option.supported_option_type = nil
    expect(product_option.valid?).to eq(false)
    expect(product_option.errors[:supported_option_type]).to include(I18n.t('test.errors.blank'))
  end
end
