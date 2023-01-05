class Cart < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  has_many :order_items
end
