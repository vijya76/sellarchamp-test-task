class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :option_value, null: false
      t.string :option_type, null: false
      t.timestamps
    end
  end
end
