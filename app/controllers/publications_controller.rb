#encoding: utf-8
class PublicationsController < ApplicationController
  before_filter :user_signed_in?, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  
  def index
  end
  
  def new
    @publication = Publication.new
  end
  
  def create
    @branch = Branch.find_by_id(session[:branch_id])
    @publication = @branch.publications.build(publication_params)
    @publication.user_id = current_user.id
    @publication.save
    redirect_to @branch
  end
  
  def destroy
    @publication.destroy
    flash[:notice] = "Se borro la publicación."
    redirect_to @branch
  end
  
  protected
  
  def publication_params
    parameters = [:content, :branch_id]
    params.require(:publication).permit(parameters)
  end
  
  def correct_user
    @branch = Branch.find_by_id(session[:branch_id])
    @publication = Publication.find_by_id(params[:id])
    if @branch.id != @publication.branch_id
      flash[:alert] = "Vos no podes hacer esto!!"
      redirect_to root_path
    end
  end
end
