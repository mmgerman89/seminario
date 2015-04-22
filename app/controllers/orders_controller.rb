#encoding: utf-8
class OrdersController < ApplicationController
  before_filter :check_for_cancel, only: [:update]
  before_filter :check_for_confirm, only: [:update]
  before_filter :check_for_reject, only: [:update]
  before_filter :authenticate_user!, only: [:create, :show, :update]
  
  def index
    @pending_orders = Order.where(branch: current_branch, status: "Pendiente")
    @sent_orders = Order.where(branch: current_branch, status: "Enviado")
  end
  
  def show
    @order_lines = current_order.order_lines
  end
  
  def update
    @order = current_order
    respond_to do |format|
      if @order.update_attributes(order_params)
        @order.status = "Pendiente"
        @order.save
        session.delete(:order_id)
        format.html { redirect_to menu_path(session[:branch_id]) if params[:commit] != "Confirmar" 
                      redirect_to orders_path if params[:commit] == "Confirmar" }  # Cambiar por pedidos eviados
      else
        format.html { redirect_to cart_path }
      end
    end
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:user, :branch, :address, :apartment, :observation, :phone, :cash, :shipping_cost)
  end
  
  def check_for_cancel
    if params[:commit] == "Cancelar"
      @order = current_order
      @order.status = "Cancelado"
      @order.save
      session.delete(:order_id)
      redirect_to branch_profile_path(session[:branch_id])
    end
  end
  
  def check_for_confirm
    if params[:commit] == "Confirmar"
      @order = Order.find_by_id(params[:order][:id])
      @order.status = "Enviado"
      @order.save
    end
  end
  
  def check_for_reject
    if params[:commit] == "Rechazar"
      @order = current_order
      @order.status = "Rechazado"
      @order.save
      redirect_to branch_profile_path(session[:branch_id])
    end
  end
  
end
