class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :branches, :type_id
  end
  
  def down
    add_column :branches, :type_id, :integer
  end
end
