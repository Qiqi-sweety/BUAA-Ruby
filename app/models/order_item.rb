class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :cart
end
