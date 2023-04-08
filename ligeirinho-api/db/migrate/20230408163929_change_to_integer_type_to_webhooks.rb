class ChangeToIntegerTypeToWebhooks < ActiveRecord::Migration[7.0]
  def change
    change_table :webhooks do |t|
      t.change :notify_types, :integer
    end
  end
end
