class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :branches, :type_id
    drop_table :commerce_categories
    drop_table :categories
  end
  
  def down
    add_column :branches, :type_id, :integer
  end
end
