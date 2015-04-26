class Api::CatsController < Api::ApiController
  def index
    @cats = Cat.where.not(id: current_user.cats)
               .to_a.select(&current_user.method(:cat_matches?))
  end
end