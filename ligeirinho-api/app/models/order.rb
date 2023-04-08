class Order < ApplicationRecord
  belongs_to :customer

  enum status: [:waiting_for_exit, :in_transit, :delivered]

  validates :description, presence: :true

  def initing_delivery
    update!({ init_delivery_at: Time.zone.now(), status: :in_transit }) if status == :waiting_for_exit
  end

  def finishing_delivery
    update!({ finish_delivery_at: Time.zone.now(), status: :delivered }) if status == :in_transit
  end
end
