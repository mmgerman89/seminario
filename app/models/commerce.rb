class Commerce < ActiveRecord::Base
  has_many :branches
  belongs_to :user
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :user, presence: true
  
  accepts_nested_attributes_for :branches, allow_destroy: true
  
  acts_as_taggable
  acts_as_taggable_on :categories
end
