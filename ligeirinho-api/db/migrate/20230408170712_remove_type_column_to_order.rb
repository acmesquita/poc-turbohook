class RemoveTypeColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.remove :type
    end
  end
end
