class AddIndexToPublications < ActiveRecord::Migration
  def change
    add_index :publications, [:branch_id, :created_at]
  end
end
