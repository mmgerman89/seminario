#encoding: utf-8
class OrdersController < ApplicationController
  
  def show
    @order_lines = current_order.order_lines
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:user, :branch, :address, :observation, :phone, :cash, :shipping_cost)
  end
  
end
