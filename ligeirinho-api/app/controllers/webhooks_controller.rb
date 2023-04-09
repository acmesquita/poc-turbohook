class WebhooksController < ApplicationController
  def create
    begin
      @webhook = ::CreateWebhookService.perform(webhook_params, customer_id)
      
      render json: @webhook, status: :ok
      return
    rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing => e
      render json: { error: 'Bad Request', message: e.message }, status: :bad_request
    else
      render json: { error: 'Internal Error' }, status: 500
    end
  end

  private

  def webhook_params
    return params.require(:webhook).permit(:url_callback, :notify_types) if params[:notify_types]
    
    params.require(:webhook).permit(:url_callback)
  end

  def customer_id
    params.require(:customer_id)
  end
end
