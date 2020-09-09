class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :approved, :boolean, null: false, default: false
    add_column :users, :name, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :sex, :string, null: false
    add_column :users, :age, :integer, null: false
  end
end
