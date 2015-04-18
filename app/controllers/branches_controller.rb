#encoding: utf-8
class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update]
  before_filter :has_permission, only: [:show, :edit, :update]
  
  def show
    @publications = @branch.publications.where("content <> ''")
    session[:branch_id] = @branch.id if @branch
    @publication = @branch.publications.build
  end
  
  def edit
    session[:return_to] = request.referer
  end
  
  def update
    if @branch.update(branch_params)
      redirect_to session.delete(:return_to), notice: 'Local actualizado correctamente'
    else
      redirect_to session.delete(:return_to), alert: 'No se puede actualizar el local'
    end
  end
  
  def new
    @branch = Branch.new
  end
  
  def create
    @branch = Branch.new
  end
  
  protected
  
  def set_branch
    @branch = Branch.find_by_id(params[:id])
  end
  
  def has_permission
    set_branch
    admin = @branch.administrators.where(user_id: current_user.id)
    if admin.empty?
      redirect_to root_path, alert: 'No tiene permisos para realizar esta operación'
    end
  end
  
  def branch_params
    params.require(:branch).permit(:name, :address, :phone, :type, :city, :photo_url)
  end
end
