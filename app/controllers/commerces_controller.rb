#encoding: utf-8
class CommercesController < ApplicationController
  before_action :set_commerce, only: [:show, :edit, :update]
  before_filter :sanitize_page_params, only: [:create]
  before_filter :authenticate_user!, only: [:new, :edit, :destroy, :create, :update]
  before_filter :verificate_user, only: [:update]
  before_filter :check_for_cancel, only: [:create, :update]
  
  def index
    @commerces = Commerce.all.order(:name)
  end
  
  def show
    session[:commerce_id] = @commerce.id if @commerce
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @commerce.update(commerce_params)
        format.html { redirect_to my_commerces_path, notice: 'Comercio actualizado correctamente' }
      else
        format.html { render :edit, alert: 'No se pudo actualizar el comercio' }
      end
    end
  end
  
  def new
    @commerce = Commerce.new
  end
  
  def create
    @commerce = Commerce.new(commerce_params)
    @commerce.user = current_user
    @commerce.branches.build
    @commerce.branches.first.name = params[:commerce][:branches][:name]
    @commerce.branches.first.city = params[:commerce][:branches][:city]
    @commerce.branches.first.address = params[:commerce][:branches][:address]
    @commerce.branches.first.phone = params[:commerce][:branches][:phone]
    
    respond_to do |format|
      if @commerce.save
        format.html { redirect_to my_commerces_path, notice: 'Comercio creado correctamente' }
      else
        format.html { render :new, alert: 'No se pudo crear el commercio' }
      end
    end
  end
  
  def my_commerces
    commerces = Commerce.all
    @my_commerces = Array.new
    commerces.each do |com|
      if com.user_id == current_user.id
        @my_commerces << com
      end
    end
  end
  
  private
  
  def set_commerce
    @commerce = Commerce.find_by_id(params[:id])
  end
  
  def commerce_params
    params.require(:commerce).permit(:name, :user, :tag_list, branches_attributes: [:name, :address, :phone, :type, :city, :photo_url])
  end
  
  def sanitize_page_params
    id = params[:commerce][:branches][:city].to_i
    params[:commerce][:branches][:city] = City.find_by_id(id)
  end
  
  def verificate_user
    commerce = Commerce.find_by_id(params[:id])
    if commerce.user != current_user
      redirect_to root_path, alert: 'No tiene permisos para realizar esta acción'
    end
  end
  
  def check_for_cancel
    if params[:commit] == "Cancelar"
      redirect_to my_commerces_path
    end
  end
end
