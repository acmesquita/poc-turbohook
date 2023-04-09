class CustomerExistsValidation < ActiveModel::Validator
  def validate(record)
    if customer_exists?(record[:customer_id])
      record.errors.add :base, 'Customer invalid'
    end
  end

  private

  def customer_exists?(customer_id)
    Customer.find(customer_id).present? rescue false
  end
end
