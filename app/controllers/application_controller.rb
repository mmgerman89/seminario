class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Configure permited parameters for the sign_up and
  # account_update Devise actions
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  
  def provinces
    country = Country.find(params[:country_id])
    respond_to do |format|
      format.json { render :json => country.provinces }
    end
  end
  
  def cities
    province = Province.find(params[:province_id])
    respond_to do |format|
      format.json { render :json => province.cities }
    end
  end
  
  def suggested_friends
    @users = Array.new    
    User.where.not(id: current_user.id).each do |u|
      if !current_user.friends.include? u and !current_user.sents.include? u and 
          !current_user.requests.include? u and !current_user.inverse_friends.include? u
        @users << u
      end
    end
  end
  
  def suggested_commerces
    @commerces = Commerce.all
  end
  
  protected
  
  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :sex_id, :photo_url, :email, :password, :password_confirmation]
    
    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
