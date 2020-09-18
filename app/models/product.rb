class Product < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :likes
  has_many :bids
  has_many :features

  monetize :opening_price_cents
  monetize :maximum_price_cents
  monetize :highest_bid_cents
end
