json.extract! delivery, :id, :time, :isFinished, :order_id, :rider_id, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
