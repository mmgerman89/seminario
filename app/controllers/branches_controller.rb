class BranchesController < ApplicationController
  def show
    @branch = Branch.find_by_id(params[:id])
    @menu = @branch.menu
  end
  
  def create
    menu = Menu.new()
  end
end
