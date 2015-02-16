class AddUserIdToCommerce < ActiveRecord::Migration
  def change
    add_column :commerces, :user_id, :integer
  end
  
  def down
    remove_column :commerces, :user_id
  end
end
