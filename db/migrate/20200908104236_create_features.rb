class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :key
      t.string :value
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
