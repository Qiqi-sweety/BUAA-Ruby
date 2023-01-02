json.extract! buyer, :id, :name, :telephone, :address, :user_id, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
