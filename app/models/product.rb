class Product < ApplicationRecord
  acts_as_favoritable
  belongs_to :category
  has_many :likes
  has_many :bids
  has_many :features
end
