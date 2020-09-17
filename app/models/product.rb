class Product < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :features, dependent: :destroy

  monetize :opening_price_cents
  monetize :maximum_price_cents
end
