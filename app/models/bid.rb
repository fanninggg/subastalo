class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :price, numericality: true
  # Am I retarded, how the fuck do you access an instance in a validation :cryingseb:
  # validates :price, :numericality => { :greater_than => self.opening_price }
end
