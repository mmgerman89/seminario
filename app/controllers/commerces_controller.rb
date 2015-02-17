class CommercesController < ApplicationController
  def show
  end
  
  def index
    @commerces = Commerce.all
  end
end
