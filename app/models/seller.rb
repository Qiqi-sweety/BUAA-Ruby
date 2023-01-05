class Seller < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_one_attached :image
  # each seller has an address and logo
end
