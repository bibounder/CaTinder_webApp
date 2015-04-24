class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  helper_method :current_user

  # needs to be here for RailsAdmin to find it
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  rescue
    session[:user_id] = nil
  end

private
  def set_locale!
    I18n.locale = :fr
  end
end