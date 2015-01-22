class MicropostController < ApplicationController
  def create
    Micropost.new(micropost_params)
  end
  
  protected
  
  def micropost_params
    parameters = [:content, :user_id]
    params.require(:micropost).permit(parameters)
  end
end
