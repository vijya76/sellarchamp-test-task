FactoryBot.define do
  factory :variant_option do
    option_type { Faker::Name.name }
    option_value { Faker::Name.name }
    variant
  end
end
