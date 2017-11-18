class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id).all
  end

  def show
    @user = User.find_by_username(params[:id])
  end
end
