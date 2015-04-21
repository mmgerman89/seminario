class OrderLinesController < ApplicationController
    
  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_line_params)
    @order.save
    session[:order_id] = @order.id
  end
  
  def update
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.update_attributes(order_line_params)
    @order_lines = @order.order_lines
  end
  
  def destroy
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.destroy
    @order_lines = @order.order_lines
  end
  
private
  
  def order_line_params
    params.require(:order_line).permit(:order, :quantity, :observation, :amount, :item_id)
  end
  
  def sanitize_page_params
    params[:order_line][:item] = Item.find_by_id(params[:order_line][:item_id])
  end
end
