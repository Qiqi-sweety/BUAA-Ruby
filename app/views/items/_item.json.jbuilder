json.extract! item, :id, :name, :price, :image, :content, :seller_id, :created_at, :updated_at
json.url item_url(item, format: :json)
