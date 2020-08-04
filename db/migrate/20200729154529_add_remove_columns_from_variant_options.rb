class AddRemoveColumnsFromVariantOptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :variant_options, :option_id
    add_column :variant_options, :option_type, :string
    add_column :variant_options, :option_value, :string
  end
end
