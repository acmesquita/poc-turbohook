class Customer < ApplicationRecord
  has_many :orders
  has_one :webhook

  validates :name, presence: :true
end
