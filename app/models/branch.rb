class Branch < ActiveRecord::Base
  belongs_to :type
  
  belongs_to :commerce

  belongs_to :city
  
  has_many :administrators
  has_many :users, through: :administrator
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :commerce }
  validates :address, presence: true
  validates :phone, presence: true
  validates :type, presence: true
  validates :city, presence: true
end
