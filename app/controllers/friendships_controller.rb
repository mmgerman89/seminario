class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], status: 'pending')
    
    if @friendship.save
      flash[:notice] = "Solicitud enviada"
      redirect_to root_path
    else
      flash[:alert] = "No se pudo enviar la solicitud"
      redirect_to root_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Amigo quitado"
    redirect_to root_path
  end
end
