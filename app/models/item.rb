class Item < ApplicationRecord
  validates :name, :brand, :unit_price, :presence => true
end
