class Commerce < ActiveRecord::Base
  has_many :commerce_category
  has_many :categories, through: :commerce_category
  has_many :branches
  
  validates :name, presence: true
end
