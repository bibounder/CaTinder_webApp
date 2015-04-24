class Api::CatLikesController < Api::ApiController
  def create(cat_id, like)
    if current_user.cat_likes.where(cat_id: cat_id)
      render json: {error: "Vous avez deja like/dislike ce chat"}
    else
      if (cat = Cat.find(cat_id))
        current_user.cat_likes << CatLike.new(cat: cat, like: like)
        render json: {ok: true, like: like}
      else
        render json: {error: "Ce chat n'existe pas"}
      end
    end
  end
end