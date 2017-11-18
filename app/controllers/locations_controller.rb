class LocationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    location = @user.locations.find(params[:location].delete(:id)) if params[:location][:id].present?
    location ||= @user.locations.build

    if location.update_attributes(location_params)
      location.shared_locations_with_friends(params[:friend_ids]) if params[:friend_ids]
      @locations = current_user.locations.to_json(include: :user)
      render layout: false
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude, :public)
  end
end
