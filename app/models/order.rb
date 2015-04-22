class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  has_many :order_lines
  
#  validates :user, presence: true
#  validates :branch, presence: true
#  validates :address, presence: true
#  validates :phone, presence: true
#  validates :cash, presence: true, numericality: { greater_than: 0 }
#  validates :shipping_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
#  validates :status, presence: true
  
  before_create :set_order_status
  before_save :update_subtotal
  
  def subtotal
    order_lines.collect { |ol| ol.valid? ? (ol.quantity * ol.unit_price) : 0 }.sum
  end
  
  private
  
  def set_order_status
    self.status = "En progreso"
  end
  
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
