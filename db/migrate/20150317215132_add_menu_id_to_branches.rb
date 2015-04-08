class AddMenuIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :menu_id, :integer
    
  end
  
  def down
    remove_column :branches, :menu_id
  end
end
