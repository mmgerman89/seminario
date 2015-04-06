class Administrator < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user
  
  validates :branch, uniqueness: { scope: :user }
  
  accepts_nested_attributes_for :user
end
