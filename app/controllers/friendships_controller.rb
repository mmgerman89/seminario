#encoding: utf-8
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
  
  def index
    if user_signed_in?
      suggested_friends
      @friendship_requests = current_user.requests
      @friends = current_user.friends
      @friends += current_user.inverse_friends
    end
  end
  
  def accept_request
    if user_signed_in?
      user = User.find_by_id(params[:friend_id])
      request = Friendship.find_by_user_id_and_friend_id(user, current_user)
      if request
        request.status = 'accepted'
        request.friends_since = Time.now
        request.save!
      else
        flash[:alert] = "No se pudo concretar la operación"
      end
      redirect_to friendships_path
    end
  end
  
  def cancel_request
    if user_signed_in?
      user = User.find_by_id(params[:friend_id])
      request = Friendship.find_by_user_id_and_friend_id(user, current_user)
      if request
        request.destroy!
        flash[:notice] = "Rechazado correctamente"
      else
        flash[:alert] = "No se pudo concretar la operación"
      end
      redirect_to friendships_path
    end
  end
  
  def unfriend
    if user_signed_in?
      user = User.find_by_id(params[:friend_id])
      request = Friendship.find_by_user_id_and_friend_id(user, current_user)
      if !request
        request = Friendship.find_by_user_id_and_friend_id(current_user, user)
      end
      
      if request
        request.destroy!
        flash[:notice] = "Eliminado correctamente"
      else
        flash[:alert] = "No se pudo concretar la operación"
      end
      redirect_to friendships_path
    end
  end
  
end
