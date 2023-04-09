class Webhook < ApplicationRecord
  belongs_to :customer

  enum notify_types: [:start_delivery, :finish_delivery, :all_hooks]

  validates :url_callback, :notify_types, presence: true
  
end
