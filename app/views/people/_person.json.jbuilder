json.extract! person, :id, :type_person_id, :name, :surname, :dni, :email, :phone, :active, :client_id, :created_at, :updated_at
json.url person_url(person, format: :json)
