class ReplaceAgeWithDob < ActiveRecord::Migration[6.0]
  def change
	  add_column :users, :dob, :datetime
	  remove_column :users, :age, :integer, null: false
  end
end
