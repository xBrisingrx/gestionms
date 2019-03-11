json.extract! fleet, :id, :type_fleet, :code, :ip_address, :hardware, :software, :client_id, :created_at, :updated_at
json.url fleet_url(fleet, format: :json)
