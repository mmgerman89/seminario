class Branch < ActiveRecord::Base
  has_one :type
  belongs_to :commerce
  
  validates :name, presence: true
  validates :type, presence: true
end
