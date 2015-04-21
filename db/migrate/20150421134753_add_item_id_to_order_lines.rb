class AddItemIdToOrderLines < ActiveRecord::Migration
  def change
    add_column :order_lines, :item_id, :integer
  end
end
