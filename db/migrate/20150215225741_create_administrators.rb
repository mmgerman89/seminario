class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :user_id
      t.integer :branch_id

      t.timestamps
    end
  end
end
