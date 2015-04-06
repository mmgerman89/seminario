class BranchesController < ApplicationController
  def show
    @branch = Branch.find_by_id(params[:id])
  end
  
  def create
  end
end
