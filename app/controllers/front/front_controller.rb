class Front::FrontController < ::ApplicationController
  # don't protect from forgery in the API
  protect_from_forgery with: :exception


  before_action :authenticate!

  helper_method :anonymous?, :authenticated?

protected
  def anonymous!
    redirect_to root_path if current_user
  end

  def anonymous?
    !current_user
  end

  def authenticate!
    redirect_to login_path unless current_user
  end

  def authenticated?
    !!current_user
  end
end