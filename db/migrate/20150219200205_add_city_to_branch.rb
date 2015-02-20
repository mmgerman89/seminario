class AddCityToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :city_id, :integer
  end
  
  def down
    remove_column :branches, :city_id
  end
end
