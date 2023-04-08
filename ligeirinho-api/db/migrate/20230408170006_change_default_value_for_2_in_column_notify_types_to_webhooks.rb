class ChangeDefaultValueFor2InColumnNotifyTypesToWebhooks < ActiveRecord::Migration[7.0]
  def change
    change_table :webhooks do |t|
      t.change :notify_types, :integer, default: 2
    end
  end
end
