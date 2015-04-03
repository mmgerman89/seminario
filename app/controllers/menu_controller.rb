class MenuController < ApplicationController
  def show
    @menu = Menu.find_by_id(params[:id])
    @branch = Branch.find_by_id(@menu.branch_id)
  end
end
