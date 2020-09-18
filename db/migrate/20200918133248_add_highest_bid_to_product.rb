class AddHighestBidToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :highest_bid_cents, :integer
  end
end
