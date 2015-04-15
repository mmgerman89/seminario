#encoding: utf-8
class MenusController < ApplicationController
  before_filter :has_permission, only: [:edit]
  
  def show
    @branch = Branch.find_by_id(session[:branch_id])
    @menu = @branch.items
  end
  
  def edit
    @branch = Branch.find_by_id(session[:branch_id])
    @menu = @branch.items
  end
  
  protected
  
  def has_permission
    branch = Branch.find_by_id(params[:id])
    admin = branch.administrators.where(user_id: current_user.id)
    if admin.empty?
      redirect_to root_path, alert: 'No tiene permisos para realizar esta operación'
    end
  end
end
