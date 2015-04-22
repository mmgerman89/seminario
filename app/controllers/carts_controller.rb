class CartsController < ApplicationController
  before_filter :authenticate_user!, only: [:show]
  def show
    @branch = Branch.find_by_id(session[:branch_id])
    @order_lines = current_order.order_lines
  end
end
