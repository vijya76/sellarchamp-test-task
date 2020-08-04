require 'factory_bot_rails'

['T-Shirt', 'Glass'].each do |product_type_name|
  FactoryBot.create(:product_type, name: product_type_name)
end
