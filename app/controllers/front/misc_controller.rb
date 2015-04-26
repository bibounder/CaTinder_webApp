class Front::MiscController < Front::FrontController
  def index
  end

  def clear_likes
    @likes_cleared = CatLike.delete_all
  end
end