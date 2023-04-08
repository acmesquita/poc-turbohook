class ChangeDefaultValueFor0InStatusColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.change :status, :integer, default: 0
    end
  end
end
