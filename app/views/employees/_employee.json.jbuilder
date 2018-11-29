json.extract! employee, :id, :name, :phone, :email, :cpf, :rg, :work_permit, :hiring, :birthdate, :salary, :address, :created_at, :updated_at
json.url employee_url(employee, format: :json)
