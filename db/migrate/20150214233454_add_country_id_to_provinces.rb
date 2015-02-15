class AddCountryIdToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :country_id, :integer
  end
  
  def down
    remove_column :provinces, :country_id
  end
end
