class LocationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    location = current_user.locations.build(location_params)

    if location.save
      location.shared_locations_with_friends(params[:friend_ids]) if params[:friend_ids]
      @locations = current_user.locations
      render layout: false
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude, :public)
  end
end
