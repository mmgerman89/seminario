class Type < ActiveRecord::Base
  has_many :branches
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
end
