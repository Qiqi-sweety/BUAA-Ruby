class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :rider, optional: true
end
