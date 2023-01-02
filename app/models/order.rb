class Order < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  has_many :order_items, dependent: :destroy
  has_one :comment, dependent: :destroy
end
