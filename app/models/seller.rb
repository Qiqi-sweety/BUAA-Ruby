class Seller < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
end