class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if user_signed_in?
  end

  def commerces
    @commerces = Commerce.all
  end
end
