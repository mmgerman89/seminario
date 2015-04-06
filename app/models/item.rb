class Item < ActiveRecord::Base
  belongs_to :branch
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :branch }
  validates :description, presence: true
  validates :price, presence: true
  validates :branch, presence: true
end
