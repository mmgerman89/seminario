class RemoveAddressToCommerce < ActiveRecord::Migration
  def change
    remove_column :commerces, :address
  end
  
  def down
    add_column :commerces, :address, :string
  end
end
