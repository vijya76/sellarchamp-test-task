class CreateProductOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_options do |t|
      t.string :supported_option_type, null: false
      t.references :product_type, foreign_key: true
      t.timestamps
    end
  end
end
