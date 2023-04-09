class FinishDeliveryService < BaseService
  validates :customer_id, presence: :true
  validates :order_id, presence: :true
  validates_with ::CustomerExistsValidation, fileds: [:customer_id]

  attr_reader :order_id, :customer_id

  def self.perform(params)
    self.new(params).perform
  end

  def initialize(params)
    @customer_id = params[:customer_id]
    @order_id = params[:order_id]
  end

  def perform
    order = Order.find(order_id)

    order.finishing_delivery!
  end
end