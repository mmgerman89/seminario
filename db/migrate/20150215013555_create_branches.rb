class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.integer :commerce_id
      t.string :address
      t.string :phone
      t.integer :type_id

      t.timestamps
    end
  end
end
