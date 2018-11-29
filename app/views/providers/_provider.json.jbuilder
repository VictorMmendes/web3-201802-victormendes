json.extract! provider, :id, :name, :phone, :email, :fancy_name, :cnpj, :cpf, :register_date, :address, :created_at, :updated_at
json.url provider_url(provider, format: :json)
