class Administrator < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user
  
  validates :branch, uniqueness: { scope: :user }
end
