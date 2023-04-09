class Order < ApplicationRecord
  belongs_to :customer

  enum status: [:waiting_for_exit, :in_transit, :delivered]

  validates :description, presence: :true

  def initing_delivery!
    self.update!(init_delivery_at: Time.zone.now(), status: :in_transit ) if self.waiting_for_exit?
  end

  def finishing_delivery!
    self.update!({ finish_delivery_at: Time.zone.now(), status: :delivered }) if self.in_transit?
  end
end
