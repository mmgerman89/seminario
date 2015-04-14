class Publication < ActiveRecord::Base
  belongs_to :branch
  
  validates :branch_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  default_scope { order('publications.created_at DESC')}
end
