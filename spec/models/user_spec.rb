# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:products) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is valid with a email, password, password_confirmation' do
    expect(create(:user)).to be_valid
  end

  it 'is invalid without an email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: 'test@example.com')
    user = FactoryBot.build(:user, email: 'test@example.com')
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('test.errors.taken'))
  end
end
