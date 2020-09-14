class CreateStrikes < ActiveRecord::Migration[6.0]
  def change
    create_table :strikes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
