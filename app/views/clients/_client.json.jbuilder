json.extract! client, :id, :name, :phone, :email, :birthdate, :cpf, :cnpj, :address, :created_at, :updated_at
json.url client_url(client, format: :json)
