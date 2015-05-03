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
    @order = current_order if params[:commit] != "Confirmar" and params[:commit] != "Rechazar"
    respond_to do |format|
      if @order.update_attributes(order_params)
        @order.status = "Pendiente" if params[:commit] != "Confirmar" and params[:commit] != "Rechazar"
        @order.cash = 0 if @order.cash.nil?
        @order.save
        session.delete(:order_id)
        format.html { redirect_to menu_path(session[:branch_id]) if params[:commit] != "Confirmar" and params[:commit] != "Rechazar"
                      redirect_to orders_path if params[:commit] == "Confirmar" or params[:commit] == "Rechazar" }  # Cambiar por pedidos eviados
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
      @order = Order.find_by_id(params[:order][:id])
      @order.status = "Rechazado"
      @order.save
    end
  end
  
end
