#encoding: utf-8
class CommercesController < ApplicationController
  before_filter :sanitize_page_params, only: [:create]
  before_filter :authenticate_user!, only: [:new, :edit, :destroy, :create, :update]
  before_filter :verificate_user, only: [:update]
  
  def index
    @commerces = Commerce.all
  end
  
  def show
    @commerce = Commerce.find_by_id(params[:id])
  end
  
  def edit
    @commerce = Commerce.find_by_id(params[:id])
  end
  
  def update
    @commerce = Commerce.find_by_id(params[:id])
    if @commerce.update(commerce_params)
      redirect_to my_commerces_path, notice: 'Comercio actualizado correctamente'
    else
      
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
    
    if @commerce.save
      redirect_to my_commerces_path, notice: 'Comercio creado correctamente'
    else
      render action: :edit
    end
    
    #respond_to do |format|
     # if @commerce.save
        #format.html { redirect_to root_path, notice: 'Commerce was successfully created.' }
        #format.json { render :show, status: :created, location: @commerce }
      #else
      #  format.html { render :new }
       # format.json { render json: @commerce.errors, status: :unprocessable_entity }
      #end
    #end
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
  
  def commerce_params
    params.require(:commerce).permit(:name, :user, :tag_list, branches_attributes: [:name, :address, :phone, :type, :city])
  end
  
  def sanitize_page_params
    #id = params[:commerce][:branches][:type].to_i
    #params[:commerce][:branches][:type] = Type.find_by_id(id)
    
    id = params[:commerce][:branches][:city].to_i
    params[:commerce][:branches][:city] = City.find_by_id(id)
  end
  
  def verificate_user
    commerce = Commerce.find_by_id(params[:id])
    if commerce.user != current_user
      redirect_to root_path, alert: 'No tiene permisos para realizar esta acción'
    end
  end
end
