class Menu < ActiveRecord::Base
  belongs_to :branch
  has_many :dishes
  
  validates :branch, presence: true
end
