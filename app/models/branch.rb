class Branch < ActiveRecord::Base
  belongs_to :commerce
  belongs_to :city
  belongs_to :menu
  
  has_many :administrators
  has_many :users, through: :administrator
  
  has_many :publications, dependent: :destroy
  has_many :items
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :commerce }
  validates :address, presence: true
  validates :phone, presence: true
  validates :city, presence: true
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :administrators
end
