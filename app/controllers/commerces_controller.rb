class CommercesController < ApplicationController
  before_filter :sanitize_page_params, only: [:create]
  
  def show
    @commerce = Commerce.find_by_id(params[:id])
  end
  
  def new
    if !user_signed_in?
      flash[:alert] = "Debe iniciar sesion para esta accion."
      redirect_to new_user_session_path
    else
      @commerce = Commerce.new
      @commerce.branches.build
    end
  end
  
  def create
    @commerce = Commerce.new(commerce_params)
    @commerce.user = current_user
    @commerce.branches.first.type = params[:commerce][:branches_attributes]["0"][:type]
    @commerce.branches.first.city = params[:commerce][:branches_attributes]["0"][:city]
    @commerce.save!
    redirect_to commerces_path
  end
  
  private
  
  def commerce_params
    params.require(:commerce).permit(:name, :user, branches_attributes: [:name, :address, :phone, :type, :city])
  end
  
  def sanitize_page_params
    id = params[:commerce][:branches_attributes]["0"][:type].to_i
    params[:commerce][:branches_attributes]["0"][:type] = Type.find_by_id(id)
    
    id = params[:commerce][:branches_attributes]["0"][:city].to_i
    params[:commerce][:branches_attributes]["0"][:city] = City.find_by_id(id)
  end
end
