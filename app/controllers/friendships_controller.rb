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
end
