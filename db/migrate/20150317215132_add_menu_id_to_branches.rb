class AddMenuIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :menu_id, :integer
    
    menus = Menu.all
    
    menus.each do |menu|
      branch = Branch.find_by_id(menu.branch_id)
      branch.menu_id = menu.id
      branch.save!
    end
  end
  
  def down
    remove_column :branches, :menu_id
  end
end
