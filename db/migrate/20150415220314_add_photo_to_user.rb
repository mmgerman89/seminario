class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string
    
    fem = Sex.find_by_name("Femenino")
    User.all.each do |u|
      u.photo_url = u.sex == fem ? "http://i61.tinypic.com/255hm6o.jpg" : "http://oi61.tinypic.com/5cy3rm.jpg"
      u.save!
    end
  end
  
  def down
    remove_columb :users, :photo_url
  end
end
