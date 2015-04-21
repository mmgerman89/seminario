class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  validates :order, presence: true
  validates :item, presence: true
#  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
#  validates :amount, presence: true, numericality: { greater_than: 0 }
  
  before_save :finalize
  
  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end
  
  def total_price
    unit_price * quantity
  end
  
private
  
  def item_present
    if item.nil?
      errors.add(:item, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
  
  def finalize
    self[:unit_price] = unit_price
    self[:amount] = quantity * self[:unit_price]
  end
  
end
