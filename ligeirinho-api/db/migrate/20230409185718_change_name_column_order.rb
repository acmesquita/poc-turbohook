class ChangeNameColumnOrder < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :finish_delivey_at, :finish_delivery_at
  end
end
