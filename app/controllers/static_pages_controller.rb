class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if user_signed_in?
    @users = Array.new    
    User.where.not(id: current_user.id).each do |u|
      if !current_user.friends.include? u
        @users << u
      end
    end
    
    @commerces = Commerce.all
  end

  def commerces
    @commerces = Commerce.all
  end
end
