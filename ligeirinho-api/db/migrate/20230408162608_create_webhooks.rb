class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.string :url_callback
      t.string :notify_types
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
