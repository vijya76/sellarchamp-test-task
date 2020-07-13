class CreateVariantOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_options do |t|
      t.references :variant, foreign_key: true
      t.references :option, foreign_key: true
      t.timestamps
    end
  end
end
