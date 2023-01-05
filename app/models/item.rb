class Item < ApplicationRecord
  belongs_to :seller
  has_one_attached: image
  has_many :order_items, dependent: :destroy
end
