class DropProductOptionsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :product_options
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
