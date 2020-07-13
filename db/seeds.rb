# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create!(
  email: 'test_user@sellarchamp.com',
  password: '123456'
)

product_type = ProductType.create!(
  name: 'T-shirt'
)

product_type_second = ProductType.create!(
  name: 'Glass'
)
