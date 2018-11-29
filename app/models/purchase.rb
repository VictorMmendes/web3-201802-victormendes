class Purchase < ApplicationRecord
  belongs_to :employee
  belongs_to :provider
  belongs_to :item

  validates :amount, :presence => true
end
