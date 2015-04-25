class Api::CatsController < Api::ApiController
  def index
    @liked_cats = current_user.cats
    # TODO match query
    # remove the cats we already (dis)liked
    @cats = Cat.where.not(id: [@liked_cats.map(&:id)])
  end
end