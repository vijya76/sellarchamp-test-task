# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'Test Product' }
    description { 'This is a test description' }
    sku { 'ABC' }
    product_type
    user
  end
end
