class Item < ApplicationRecord
  belongs_to :seller
  has_many :order_items, dependent: :destroy
  has_one_attached :image
end
