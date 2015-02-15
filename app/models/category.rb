class Category < ActiveRecord::Base
  has_many :commerce_category
  has_many :commerces, through: :commerce_category
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
end
