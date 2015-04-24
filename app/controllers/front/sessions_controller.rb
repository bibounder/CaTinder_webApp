class Front::SessionsController < Front::FrontController
  skip_before_action :authenticate!
  layout 'unauthenticated'

  def new
  end

  def create(email, password)
    user = User.find_by_email(email)
    if user.try(:authenticate, password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      @error = 'Nom de compte / mot de passe incorrect !'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
  end
end