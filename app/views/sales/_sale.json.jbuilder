json.extract! sale, :id, :amount, :unit_price, :total_price, :date, :employee_id, :client_id, :item_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
