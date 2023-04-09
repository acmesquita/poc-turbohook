class CreateWebhookService < BaseService
  validates :url_callback, presence: :true
  validates_with ::UrlValidation, fileds: [:url_callback]

  attr_reader :url_callback, :notify_types, :customer_id

  def self.perform(webhook_params, customer_id)
    self.new(webhook_params, customer_id).perform
  end

  def initialize(webhook_params, customer_id)
    @url_callback = webhook_params[:url_callback]
    @notify_types = webhook_params[:notify_types] || 2
    @customer_id= customer_id
  end

  def perform
    Webhook.create!({
      url_callback: url_callback,
      notify_types: notify_types,
      customer_id: customer_id
    })
  end
end