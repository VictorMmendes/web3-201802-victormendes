class Client < ApplicationRecord
  validates :name, :phone, :email, :cpf, :address, :presence => true
end
