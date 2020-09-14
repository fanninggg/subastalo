class AddPriceCentsToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :price_cents, :integer
    remove_column :bids, :price
  end
end
