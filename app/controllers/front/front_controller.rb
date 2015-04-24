class Front::FrontController < ::ApplicationController
  before_action :authenticate!

protected
  def authenticate!
    redirect_to login_path unless current_user
  end

  def anonymous!
    redirect_to root_path if current_user
  end

  def authenticated?
    !!current_user
  end

  def anonymous?
    !current_user
  end
end