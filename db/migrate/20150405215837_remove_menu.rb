class RemoveMenu < ActiveRecord::Migration
  def change
    drop_table :menus
  end
end
