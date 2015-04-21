class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :branch_id
      t.string :address
      t.string :apartment
      t.string :observation
      t.decimal :cash
      t.decimal :shipping_cost
      t.string :state

      t.timestamps
    end
  end
end
