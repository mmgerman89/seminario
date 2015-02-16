class CommerceCategory < ActiveRecord::Base
  belongs_to :commerce
  belongs_to :category
  
  validates :commerce, uniqueness: { scope: :category }
end
