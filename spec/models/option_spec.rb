# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:option_type).of_type(:string) }
    it { is_expected.to have_db_column(:option_value).of_type(:string) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:option)).to be_valid
  end

  it 'is valid with option_type and option_value' do
    expect(create(:option)).to be_valid
  end

  it 'is invalid without option_type' do
    option = FactoryBot.build(:option)
    option.option_type = nil
    expect(option.valid?).to eq(false)
    expect(option.errors[:option_type]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid without option_value' do
    option = FactoryBot.build(:option)
    option.option_value = nil
    expect(option.valid?).to eq(false)
    expect(option.errors[:option_value]).to include(I18n.t('test.errors.blank'))
  end
end
