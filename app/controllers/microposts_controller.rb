class MicropostsController < ApplicationController
  before_filter :user_signed_in?, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  
  def index
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.save
    redirect_to root_path
  end
  
  def destroy
    @micropost.destroy
    flash[:notice] = "Se borro el comentario."
    redirect_to root_path
  end
  
  protected
  
  def micropost_params
    parameters = [:content, :user_id]
    params.require(:micropost).permit(parameters)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    if @micropost.nil?
      flash[:alert] = "Vos no podes hacer esto!!"
      redirect_to root_path
    end
  end
end
