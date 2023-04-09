class CreateOrderService < BaseService
  validates :description, presence: :true
  validates_with ::CustomerExistsValidation, fileds: [:customer_id]

  attr_reader :description, :customer_id

  def self.perform(order_params, customer_id)
    self.new(order_params, customer_id).perform
  end

  def initialize(order_params, customer_id)
    @description = order_params[:description]
    @customer_id= customer_id
  end

  def perform
    Order.create!({
      description: description,
      customer_id: customer_id
    })
  end
end