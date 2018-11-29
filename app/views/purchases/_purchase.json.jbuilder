json.extract! purchase, :id, :amount, :unit_price, :total_price, :date, :employee_id, :provider_id, :item_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
