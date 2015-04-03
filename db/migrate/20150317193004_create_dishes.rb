class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.decimal :price

      t.timestamps
    end
  end
end
