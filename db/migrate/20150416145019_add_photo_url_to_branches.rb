class AddPhotoUrlToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :photo_url, :string
    
    Branch.all.each do |branch|
      branch.photo_url = "http://s8.tinypic.com/2mzcvnl_th.jpg"
      branch.save!
    end
  end
  
  def down
    remove_column :branches, :photo_url
  end
end
