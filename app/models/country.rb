class Country < ActiveRecord::Base
  has_many :provinces
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
end
