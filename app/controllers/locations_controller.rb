class LocationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.locations.create(location_params)
      redirect_to root_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
