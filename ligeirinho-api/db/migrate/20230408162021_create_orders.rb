class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :description
      t.datetime :init_delivery_at
      t.datetime :finish_delivey_at

      t.timestamps
    end
  end
end
