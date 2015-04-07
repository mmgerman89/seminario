class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @micropost = current_user.microposts.build

      @users = Array.new    
      User.where.not(id: current_user.id).each do |u|
        if !current_user.friends.include? u
          @users << u
        end
      end
      
      @commerces = Commerce.all
    end
  end

  def commerces
    @commerces = Commerce.all
  end
end
