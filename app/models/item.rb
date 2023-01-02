class Item < ApplicationRecord
  belongs_to :store
  has_many :order_items, dependent: :destroy
end
