class ChangeDobToDate < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :dob, :date
  end
end
