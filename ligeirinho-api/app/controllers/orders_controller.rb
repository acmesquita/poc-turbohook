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

  def init_delivery
    begin
      @order = ::InitDeliveryService.perform(init_delivery_params)

      if @order.nil?
        render json: { error: 'This order in delivery or done'}
      end
      
      return
    rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing
      render json: { error: 'Bad Request' }, status: :bad_request
    else
      render json: { error: 'Internal Error' }, status: 500
    end
  end

  def finish_delivery
    begin
      @order = ::FinishDeliveryService.perform(init_delivery_params)

      if @order.nil?
        render json: { error: 'This order in delivery or done'}
      end

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

  def init_delivery_params
    {customer_id: customer_id, order_id: params[:order_id]}
  end
end
