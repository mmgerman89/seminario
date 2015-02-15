class Province < ActiveRecord::Base
  belongs_to :country
  has_many :cities
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
end
