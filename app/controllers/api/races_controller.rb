class Api::RacesController < Api::ApiController
  def index
    @races = Race.all
  end
end