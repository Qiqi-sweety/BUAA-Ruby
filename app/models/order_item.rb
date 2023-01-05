class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
end
