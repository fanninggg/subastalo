class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  monetize :price_cents
  validates :price_cents, numericality: true
  validate :price_in_range
  validate :bidder_approved
  validate :whole_number

  def whole_number
    unless price_cents.to_s.split('').last(2).all? { |digit| digit == "0"}
      errors.add(:price, 'must be a whole number')
    end
  end

  def price_in_range
    if price_cents < product&.opening_price_cents
      errors.add(:bid, 'must be greater than or equal to opening price')
    elsif price_cents > product&.maximum_price_cents
      errors.add(:bid, 'must be less than or equal to maximum price')
    elsif price_cents <= (product&.bids&.maximum(:price_cents) || 0)
      errors.add(:bid, 'must be greater than previous bid')
    elsif product&.bids.length > 1
      if price_cents < (product&.bids&.maximum(:price_cents) + (product&.bid_increment * 100))
        errors.add(:bid, "must increase in increments of $#{product.bid_increment}")
      end
    end
  end

  def bidder_approved
    unless user.approved?
      errors.add(:user, 'must be approved')
    end
  end
end
