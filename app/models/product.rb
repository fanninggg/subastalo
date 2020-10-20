class Product < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many_attached :photos
  has_many_attached :documents

  monetize :opening_price_cents
  monetize :maximum_price_cents
  monetize :highest_bid_cents, allow_nil: true
  validates_size_of :photos, maximum: 100.kilobytes, message: "should be less than 100KB"
end
