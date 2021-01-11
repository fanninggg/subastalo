class AddFieldsToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :hidden, :boolean, default: false
    add_column :categories, :terms, :text
    add_column :categories, :description, :text
  end
end
