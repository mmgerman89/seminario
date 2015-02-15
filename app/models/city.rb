class City < ActiveRecord::Base
  belongs_to :province
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
end
