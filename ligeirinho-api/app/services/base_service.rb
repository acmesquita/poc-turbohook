class BaseService
  include ActiveModel::Validations

  def initialize
    validate!
  end
end