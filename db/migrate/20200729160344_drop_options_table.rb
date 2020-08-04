class DropOptionsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :options
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
