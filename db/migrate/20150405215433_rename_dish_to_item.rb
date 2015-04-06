class RenameDishToItem < ActiveRecord::Migration
  def change
    remove_column :dishes, :menu_id
    rename_table :dishes, :items
    add_column :items, :branch_id, :integer
  end
  
  def down
    remove_column :items, :branch_id
    rename_table :items, :dishes
    add_column :dishes, :menu_id, :integer
  end
end
