json.extract! order_item, :id, :count, :money, :item_id, :order_id, :cart_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
