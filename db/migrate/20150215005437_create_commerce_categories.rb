class CreateCommerceCategories < ActiveRecord::Migration
  def change
    create_table :commerce_categories do |t|
      t.integer :commerce_id
      t.integer :category_id

      t.timestamps
    end
  end
end
