FactoryBot.define do
  factory :variant do
    price { 10.0 }
    quantity { 2 }
    sku { 'DEF' }
    product
  end
end
