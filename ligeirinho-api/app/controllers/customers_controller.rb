class CustomersController < ApplicationController
  def create
    begin
      @customer = ::CreateCustomerService.perform(customer_params)
      
      render json: @customer, status: :ok
    rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing
      render json: { error: 'Bad Request' }, status: :bad_request
    else
      render json: { error: e.message }, status: 500
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
