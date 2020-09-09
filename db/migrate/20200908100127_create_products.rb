class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :opening_price
      t.float :maximum_price
      t.datetime :start_time
      t.datetime :end_time
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
