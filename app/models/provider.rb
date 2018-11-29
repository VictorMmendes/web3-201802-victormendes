class Provider < ApplicationRecord
  validates :name, :phone, :email, :fancy_name, :cnpj, :address, :presence => true
end
