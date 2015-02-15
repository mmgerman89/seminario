class CommerceCategory < ActiveRecord::Base
  belongs_to :commerce
  belongs_to :category
end
