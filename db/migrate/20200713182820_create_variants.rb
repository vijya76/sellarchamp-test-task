class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :sku, null: false
      t.decimal :price
      t.integer :quantity
      t.references :product, foreign_key: true
      t.timestamps

      # adds indexing to sku field
      t.index :sku, unique: true
    end
  end
end
