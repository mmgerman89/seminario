class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :branch_id

      t.timestamps
    end
  end
end
