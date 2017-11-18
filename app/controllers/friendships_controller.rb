class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if friendship.save
      redirect_to users_path, notice: "Added friend."
    else
      redirect_to users_path, error: "Unable to add friend."
    end
  end

  def update
    friendship = current_user.inverse_friendships.find_by(user_id: params[:id])
    if friendship.accept
      redirect_to request.referrer, notice: "Friendship accepted"
    else
      redirect_to request.referrer, notice: "Some thing went wrong"
    end
  end

  def destroy
    friendship = Friendship.where(user_id: [current_user, params[:id]]).where(friend_id: [current_user, params[:id]]).last
    friendship.destroy
    redirect_to request.referrer, notice: "Removed friendship."
  end
end
