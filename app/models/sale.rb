class Sale < ApplicationRecord
  belongs_to :employee
  belongs_to :client
  belongs_to :item

  validates :amount, :unit_price, :presence => true
end
