# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VariantOption, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:variant_id).of_type(:integer) }
    it { is_expected.to have_db_column(:option_type).of_type(:string) }
    it { is_expected.to have_db_column(:option_value).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:variant) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:variant_option)).to be_valid
  end
end
