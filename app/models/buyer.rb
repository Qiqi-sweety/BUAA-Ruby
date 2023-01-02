class Buyer < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
end
