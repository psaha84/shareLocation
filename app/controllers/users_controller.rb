class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id).all
    @pending_friend_ids = current_user.pending_friends.pluck(:friend_id)
    @requested_friend_ids = current_user.requested_friends.pluck(:user_id)
  end

  def show
    @user = User.find_by_username(params[:id])
  end
end
