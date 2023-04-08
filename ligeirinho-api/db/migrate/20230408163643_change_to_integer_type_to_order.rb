class ChangeToIntegerTypeToOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.change :type, :integer
    end
  end
end
