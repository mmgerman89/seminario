class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :quantity
      t.string :observation
      t.decimal :amount

      t.timestamps
    end
  end
end
