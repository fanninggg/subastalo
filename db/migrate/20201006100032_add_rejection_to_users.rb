class AddRejectionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rejection, :string
  end
end
