class OrdersController < ApplicationController
  def create
    begin
      @order = ::CreateOrderService.perform(order_params, customer_id)
      
      render json: @order, status: :ok
      return
    rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing
      render json: { error: 'Bad Request' }, status: :bad_request
    else
      render json: { error: 'Internal Error' }, status: 500
    end
  end

  private

  def order_params
    params.require(:order).permit(:description)
  end

  def customer_id
    params.require(:customer_id)
  end
end
