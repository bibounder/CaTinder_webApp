class Api::CatsController < Api::ApiController
  def index
    @liked_cats = current_user.cats
    # remove the cats we already (dis)liked
    @cats = Cat.where.not(id: @liked_cats)
    if current_user.check_cat_exterior?
      @cats = @cats.where(wants_exterior: false)
    end
    if current_user.has_pets?
      @cats = @cats.where(sociable: true)
    end
  end
end