#encoding: utf-8
class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update]
  before_filter :sanitize_page_params, only: [:create, :update]
  before_filter :has_permission, only: [:show, :edit, :update]
  before_filter :check_for_cancel, only: [:create, :update]
  
  def show
    @publications = @branch.publications.where("content <> ''")
    session[:branch_id] = @branch.id if @branch
    @publication = @branch.publications.build
  end
  
  def edit
    session[:return_to] = request.referer
    @province_id = @branch.city.province.id
    @country_id = @branch.city.province.country.id
  end
  
  def update
    @branch.city = City.find_by_id(params[:branch][:city])
    if @branch.update(branch_params)
      redirect_to session.delete(:return_to), notice: 'Local actualizado correctamente'
    else
      redirect_to session.delete(:return_to), alert: 'No se puede actualizar el local'
    end
  end
  
  def new
    @branch = Branch.new
    @branch.administrators.build
    @province_id = 0
    @country_id = 0
  end
  
  def create
    @branch = Branch.new(branch_params)
    admin = Administrator.new(user: current_user, branch: @branch)
    @branch.city = City.find_by_id(params[:branch][:city])
    @branch.commerce = Commerce.find_by_id(session[:commerce_id])
    respond_to do |format|
      if @branch.save
        admin.save!
        format.html { redirect_to branch_path(@branch.id), notice: 'Local creado correctamente' }
      else
        format.html { render :new, alert: 'No se pudo crear el local' }
      end
    end
  end
  
  def profile
    @branch = Branch.find_by_id(params[:id])
  end
  
  private
  
  def sanitize_page_params
    id = params[:branch][:city].to_i
    params[:branch][:city] = City.find_by_id(id)
  end
  
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
  
  def check_for_cancel
    if params[:commit] == "Cancelar"
      redirect_to commerce_path(session[:commerce_id])
    end
  end
end
