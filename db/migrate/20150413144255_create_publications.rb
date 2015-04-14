class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :content
      t.integer :branch_id
      t.integer :user_id

      t.timestamps
    end
  end
end
