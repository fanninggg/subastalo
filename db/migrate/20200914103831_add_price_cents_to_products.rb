class AddPriceCentsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :opening_price_cents, :integer
    add_column :products, :maximum_price_cents, :integer
    remove_column :products, :opening_price
    remove_column :products, :maximum_price
  end
end
