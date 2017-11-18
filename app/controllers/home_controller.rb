class HomeController < ApplicationController
  def index
    @locations = Location.shared.limit(10)
  end
end
