class HomeController < ApplicationController
  def index
    @locations = Location.public_to_all.limit(10)
    @locations = @locations.to_json(include: :user)
  end
end
