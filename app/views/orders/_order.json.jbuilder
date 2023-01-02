json.extract! order, :id, :time, :money, :isProcessed, :isDelivered, :seller_id, :buyer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
