class AddBidIncrementToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :bid_increment, :integer
  end
end
