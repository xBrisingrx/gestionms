json.extract! client, :id, :name, :fantasy_name, :cuit, :email, :iva_condition, :sale_condition, :direction, :location, :province, :phone, :active, :created_at, :updated_at
json.url client_url(client, format: :json)
