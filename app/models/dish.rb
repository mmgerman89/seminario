class Dish < ActiveRecord::Base
  belongs_to :menu
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :menu }
  validates :description, presence: true
  validates :price, presence: true
  validates :menu, presence: true
end
