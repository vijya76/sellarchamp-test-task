FactoryBot.define do
  factory :product_option do
    supported_option_type { 'COLOR' }
    product_type
  end
end
