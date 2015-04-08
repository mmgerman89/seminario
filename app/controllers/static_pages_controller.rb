class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @micropost = current_user.microposts.build

      suggested_friends
      suggested_commerces
    end
  end

  def commerces
    @commerces = Commerce.all
  end
end
