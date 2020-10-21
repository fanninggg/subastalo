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
  validates :name, :description, :start_time, :end_time, :opening_price_cents, :maximum_price_cents, :category_id, presence: true
  validates :photos, presence: true, blob: { content_type: :image, size_range: 1..100.kilobytes }
end
