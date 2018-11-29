class Employee < ApplicationRecord
  validates :name, :phone, :email, :cpf, :rg, :work_permit, :salary, :address, :presence => true
end
