class Api::CatsController < Api::ApiController
  def index
    @cats = Cat.all
  end
end