class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  monetize :price_cents
  validates :price_cents, numericality: true
  validate :price_in_range
  validate :bidder_approved


  def price_in_range
    if price_cents < product&.opening_price_cents
      errors.add(:price, 'must be greater than or equal to opening price')
    elsif price_cents > product&.maximum_price_cents
      errors.add(:price, 'must be less than or equal to maximum price')
    elsif price_cents <= (product&.bids&.maximum(:price_cents) || 0)
      errors.add(:price, 'must be greater than previous bid')
    end
  end

  def bidder_approved
    unless user.approved?
      errors.add(:user, 'must be approved')
    end
  end
end
