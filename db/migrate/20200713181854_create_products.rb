class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :sku, null: false
      t.references :user, foreign_key: true
      t.references :product_type, foreign_key: true
      t.timestamps

      # adds indexing to sku field
      t.index :sku, unique: true
    end
  end
end
