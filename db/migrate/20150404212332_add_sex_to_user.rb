class AddSexToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex_id, :integer # "" sin especificar, M masculino, F femenino
    
    
  end
  
  def down
    remove_column :users, :sex_id
  end
end
