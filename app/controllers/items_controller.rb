#encoding: utf-8
class ItemsController < ApplicationController
  before_action :has_permission, only: [:create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, onl: [:create, :update]
  
  def show
    @item = Item.find_by_id(params[:id])
    
    respond_to do |format|
      format.js { }
      format.html
    end
  end
  
  def edit
    session[:return_to] = request.referer
  end
  
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to edit_menu_path(session[:branch_id]), notice: 'Item actualizado correctamente' }
      else
        format.html { render :edit, alert: 'No se puede actualizar el item' }
      end
    end
  end
  
  def new
    @item = Item.new
    session[:return_to] = request.referer
  end
  
  def create
    @item = Item.new(item_params)
    @item.branch = @branch
    respond_to do |format|
      if @item.save
        format.html { redirect_to session.delete(:return_to), notice: 'Item creado correctamente' }
      else
        format.html { render :new, alert: 'No se pudo crear el item.' }
      end
    end
  end
  
  def destroy
    session[:return_to] = request.referer
    @item.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: "Item eliminado correctamente" }
    end
  end
  
  protected
  
  def set_item
    @item = Item.find_by_id(params[:id])
  end
  
  def has_permission
    @branch = Branch.find_by_id(session[:branch_id])
    admin = @branch.administrators.where(user_id: current_user.id)
    set_item
    item = @branch.items.where(id: @item.id)
    if admin.empty? or item.empty?
      redirect_to root_path, alert: 'No tiene permisos para realizar esta operación'
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :description, :photo, :price, :branch)
  end
  
  def check_for_cancel
    if params[:commit] == "Cancelar"
      redirect_to edit_menu_path(session[:branch_id])
    end
  end
end
