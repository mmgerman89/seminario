class AddUnitPriceToOrderLine < ActiveRecord::Migration
  def change
    add_column :order_lines, :unit_price, :decimal
  end
  
  def down
    remove_column :order_lines, :unit_price
  end
end
