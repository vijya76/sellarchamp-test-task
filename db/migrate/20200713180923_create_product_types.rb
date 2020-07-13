class CreateProductTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_types do |t|
      t.string :name, null: false
      t.timestamps

      # adds indexing to name field
      t.index :name, unique: true
    end
  end
end
