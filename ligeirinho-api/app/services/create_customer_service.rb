class CreateCustomerService < BaseService
  validates :name, presence: :true

  attr_reader :name

  def self.perform(params)
    self.new(params).perform
  end

  def initialize(params)
    @name = params[:name]
  end

  def perform
    Customer.create!({ name: name })
  end
end