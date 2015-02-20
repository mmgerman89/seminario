class Commerce < ActiveRecord::Base
  has_many :commerce_categories
  has_many :categories, through: :commerce_category
  has_many :branches
  belongs_to :user
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :user, presence: true
  
  accepts_nested_attributes_for :branches
end
