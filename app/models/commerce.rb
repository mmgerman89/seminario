class Commerce < ActiveRecord::Base
  has_many :commerce_categories
  has_many :categories, through: :commerce_category
  has_many :branches
  belongs_to :user
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
